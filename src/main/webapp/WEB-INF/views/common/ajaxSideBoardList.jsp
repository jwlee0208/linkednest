<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.list-group-item-category {
	z-index: 0;
    color: #fff;
    background-color: #efefef;
    border-color: #ddd;
}
</style>


		<c:if test="${sideShareInfo ne null}">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						
						<p style="text-align:center;">
							<img src="/img/default_img.jpg" alt="..." class="img-rounded" data-src="holder.js/200x200" style="align:center;">
						</p>
						<p class="text-primary" style="text-align:center;"><a href="/share/${sideShareInfo.userId}/profile">Here is ${sideShareInfo.shareName}</a></p>
						<p class="text-muted" 	style="text-align:center;">Joined Date : ${sideShareInfo.createDate}</p>		
					</div>
				</div>
			</div>		
		</c:if>	
<c:choose>		  
    <c:when test="${sideBoardList ne null}">	
    	<c:set var="classInfo" value="collapse"/>	
    	<c:forEach var="categoryInfo" items="${sideBoardList}" varStatus="index">
    		<div class="list-group">
    		<a href="#sideCategoryDiv${categoryInfo.boardCategoryId}" class="list-group-item list-group-item-category" style="font-weight: bold;" data-toggle="collapse" aria-controls="sideCategoryDiv${categoryInfo.boardCategoryId}">${categoryInfo.boardCategoryName}</a>
    		<div id="sideCategoryDiv${categoryInfo.boardCategoryId}" class="${classInfo}">
    		<c:set var="boardList" value="${categoryInfo.sideBoardList}"/>
    		
		<c:if test="${boardList ne null}">
			<c:forEach var="boardInfos" items="${boardList}">
				<c:set var="url" value="/share/list/${boardInfos.boardInfo.boardId}"/>
				<c:if test="${userId ne null && userId ne ''}">
					<c:set var="url" value="/share/${userId}/list/${boardInfos.boardInfo.boardId}"/>
				</c:if>
				<a href="${url}" class="list-group-item" id="sideBoardMenu_${boardInfos.boardInfo.boardId}">&nbsp;&nbsp;&nbsp;${boardInfos.boardInfo.boardName} <span class="badge"> ${boardInfos.boardArticleCnt} </span></a>
			</c:forEach>
		 </c:if>
    		</div>    		
    		</div>
    	</c:forEach>
    		<%--<div>
    		    <a href='http://smart.linkprice.com/blog_banner_link.php?BKN=62587a395173145&minishop_id=4&affiliate_id=A100541931&width=160&height=600&u_id=' target='_blank' onmouseover="window.status=' ';return true"><img src='http://minishop.linkprice.com/minishop.php?BKN=62587a395173145&minishop_id=4&affiliate_id=A100541931&width=160&height=600&u_id=' border='0'></a>
    		</div>--%>
    </c:when>
    <c:otherwise>
    	<%--<div class="list-group">
    		<a href="http://minishop.linkprice.com/blog_banner_link.php?BKN=62587a383306401&m=tripadviso&a=A100541931&width=250&height=250&u_id=&store=" target="_blank"><img src="http://ad.linkprice.com/stlink.php?BKN=62587a383306401&m=tripadviso&a=A100541931&type=stlink&width=250&height=250&u_id=&store=" border="0"></a>
    		<br/>
    		<a href="http://minishop.linkprice.com/blog_banner_link.php?BKN=62587a3a0abd3bc&m=agoda&a=A100541931&width=150&height=60&u_id=&store=" target="_blank"><img src="http://ad.linkprice.com/stlink.php?BKN=62587a3a0abd3bc&m=agoda&a=A100541931&type=stlink&width=150&height=60&u_id=&store=" border="0"></a>
    		<br/>
    		<a href="http://minishop.linkprice.com/blog_banner_link.php?BKN=62587a38e5b2409&m=webtour&a=A100541931&width=250&height=250&u_id=&store=" target="_blank"><img src="http://ad.linkprice.com/stlink.php?BKN=62587a38e5b2409&m=webtour&a=A100541931&type=stlink&width=250&height=250&u_id=&store=" border="0"></a>
    		<br/>
    		<a href='http://smart.linkprice.com/blog_banner_link.php?BKN=62587a395173145&minishop_id=4&affiliate_id=A100541931&width=160&height=600&u_id=' target='_blank' onmouseover="window.status=' ';return true"><img src='http://minishop.linkprice.com/minishop.php?BKN=62587a395173145&minishop_id=4&affiliate_id=A100541931&width=160&height=600&u_id=' border='0'></a>
    	</div>--%>
    </c:otherwise>	
</c:choose>    		  
          