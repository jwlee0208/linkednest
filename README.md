#LinkedNest Project

##Purpose
###- Link Between Player With Team(Club).
	- URL : http://linkednest.net
###- Share Knowledge, Experiences
	- URL : http://linkednest.net/share

##Functions
- Membership
	- Sign Up 
	- Sign In 
	- Configure To Private Informations	
- Upload Profile For Player
	- Upload Image File To Cdn Server
	- Upload Image File To Flickr Service
	- Search Image Files Using Flickr Api Service
	- Search Stream List Using Youtube Api
- Write Article Using WISIWIG Editor 
	- TinyMCE(4.x ver.) 
			

##Redis Installation And Configuration Guide
###- Go to http://redis.io/download , download and execute to install redis
###- Set about redis into pom.xml(maven dependency) and update maven dependency following this : 
		
		<dependency>
			<groupId>redis.clients</groupId>
			<artifactId>jedis</artifactId>
			<version>2.5.2</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework.data</groupId>
			<artifactId>spring-data-redis</artifactId>
			<version>1.4.0.RELEASE</version>
		</dependency>
			
###- Update maven dependency
		if you use to eclipse, 
		- Select to project
		- Click to right mouse
		- Select 'Maven > Update Project'
		
###- Create to redis_config.xml into "src/main/resources/spring" directory following this : 
		
		<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:p="http://www.springframework.org/schema/p"
		xmlns:context="http://www.springframework.org/schema/context"
		xsi:schemaLocation="
			http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
			http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
			http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache.xsd">
				 
		 	<bean id="redisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
		 		<property name="minIdle" value="1"></property>
		 		<property name="maxIdle" value="30"></property>
		 		<property name="maxTotal" value="30"></property>
		 		<property name="maxWaitMillis" value="10000"></property>
		 		<property name="testOnBorrow" value="true"></property>
		 	</bean>
				  
		 	<bean id="connectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory">
		 		<property name="hostName" value="127.0.0.1"></property>
		 		<property name="port" value="6379"></property>
		 		<property name="password" value="123456"></property>
		 		<property name="usePool" value="yes"></property> 
			 	<property name="poolConfig" ref="redisPoolConfig"></property>		 	
			 	<property name="database" value="0"></property><!-- default 0 디비  dao영역에서 index 값 파라메터로 던져서 실시간으로 변경 감지 가능함.-->
			</bean>
 
			<bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
		    		<property name="connectionFactory" ref="connectionFactory" />
			</bean>
		</beans>
	
###- Import redis-config.xml into application-config.xml following this : 
			
		<import resource = "classpath:spring/redis-config.xml" />
			
###- Create to java source

		@Autowired
		private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
			
		@Resource(name="redisTemplate")
		private ValueOperations<String, List<BoardArticleDto>> valueOps;
			
		@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
		public String getBoardList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception {
			model = this.getBoardCommonListForJson(request, model, boardArticleDto);
						
			String page = "board/article/list";
							
			if(boardArticleDto.getBoardId() == 1){
				page = "board/article/imageList";
			}else if(boardArticleDto.getBoardId() == 2){
				page = "board/article/imageList2";
			}
				
			return page;
		}
			
		private Model getBoardCommonListForJson(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
			
			String searchCondition = request.getParameter("searchCondition");
			String searchText = request.getParameter("searchText");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			int boardId = boardArticleDto.getBoardId();
			
			int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : 	DEFAULT_PAGE_NO;
			
			int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;
				
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			paramMap.put("boardId", boardId);
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchText", searchText);
			paramMap.put("startDate", startDate);
			paramMap.put("endDate", endDate);
			
			List<BoardArticleDto> boardArticleList;	
			int totalListCnt = 0;
			
			try{
				boardArticleList = valueOps.get("selectBoardArticle"+boardId+"ListAll");
				totalListCnt = boardArticleList.size();
				
				System.out.println(">>> redis pagedList print");
				
			}catch(Exception e){
				BoardArticleDto boardArticleObj = new BoardArticleDto();
				boardArticleObj.setBoardId(boardId);
				boardArticleList = boardArticleService.getBoardArticleList(boardArticleObj);
				totalListCnt = boardArticleList.size();	
					
				valueOps.set("selectBoardArticle"+boardId+"ListAll", boardArticleList);
				
				System.out.println(">>> redis pagedList setted");
				
				model = this.getBoardCommonList(request, model, boardArticleDto);
				
				return model;
				
			}finally{
					
			}
					
			int startRow = (pageNo - 1) * listRowCnt;
			int endRow 	 = pageNo * listRowCnt;
					
			List<BoardArticleDto> pagedArticleList = new ArrayList<BoardArticleDto>();
				
			if(null != boardArticleList){
				BoardArticleDto boardArticleObj;
				for(int i = 0; i < boardArticleList.size() ; i++){
					
					if((startRow - 1) <= i && i <= (endRow - 1)){					
						boardArticleObj = boardArticleList.get(i);
						pagedArticleList.add(boardArticleObj);
					}
				}
			}
				
			PagedList pagedList = new PagedList(pagedArticleList, pageNo, 10, totalListCnt, startRow, endRow, listRowCnt);
				
			System.out.println("pagedList Data : " + pagedList.toString());		
				
			model.addAttribute("pagedResult", pagedList);
			model.addAttribute("boardId", boardId);
				
			return model;
		}
		
		* This code is just for checking out to spring-data-redis. 
		* I think it'll be better to create mvc pattern and to create source each class.  
		 
###- Build to project

###- Set to redis sentinel & Start to redis
	  * I tested using redis sentinel for master/slave monitoring and syncronize to data into 1 server(local : 127.0.0.1)
	  
###- Set to redis sentinel
	  Ref.] http://megnetsun.tistory.com/entry/Redis-Master-Slave-server-%EC%84%A4%EC%A0%95%EC%9E%A1%EA%B8%B0-Sentinel-tool%EB%A1%9C-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81-%ED%95%98%EA%B8%B0

###- Create to redis-master.conf
		slave-server-stale-data yes
		requirepass 123456
	
###- Create to redis-slave.conf

		slaveof 127.0.0.1 6379
		masterauth 123456
		repl-ping-slave-period 10
		repl-timeout 60 

###- Modify to sentinel.conf

		sentinel monitor mymaster 127.0.0.1 6379 1    
		sentinel auth-pass mymaster 123456            
		sentinel can-failover mymaster yes            
		sentinel parallel-syncs mymaster 1            

###- Startup master redis

		./src/redis-server redis-master.conf &


###- Startup slave redis

		./src/redis-server redis-slave.conf &


###- Startup Sentinel

		$ ./redis-server ../sentinel.conf --sentinel


###- Startup Tomcat Server

