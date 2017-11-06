(function(){
	var gem = [{
				name   			: 'MacBook Air'
			  , price  			: '1500.90'
			  , images 			: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
			  			 	 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]  
			  , description 	: "It's very thin. When you carry on it to somewhere, make to feel like a 'air'!!!"
			  , specification 	: "OS X included"
			  , reviews 		: [{
			            			     stars 		: 5
			            			   , comment 	: "Love it!"
			            			   , author		: "gim@main.com"	   
			            		   },
			            		   {
			            			     stars 		: 4
				            		   , comment 	: "So so.."
				            		   , author		: "scott@main.com"	   
			            		   }]	  
			  },
			  {
				name 			: 'MacBook Pro'
			  , price 			: '3000.55'
			  , images 			: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 		 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  , description 	: "It's thin more than older!!!"
			  , specification 	: "OS X included"
			  , reviews 		: [{
					     			     stars 		: 4
					     			   , comment 	: "Very nice!"
					     			   , author		: "tiger@main.com"	   
					     		   },
					     		   {
					     			     stars 		: 4
					         		   , comment 	: "what a ..."
					         		   , author		: "oracle@main.com"	   
					     		   }]	  
			  },
			  {
				name 	: 'MacBook Pro Retina'
			  , price 	: '5000'
			  , images 	: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  , description 	: "It's thin more than older!!!"
			  , specification 	: "OS X included"
			  , reviews 		: [{
					     			     stars 		: 3
					     			   , comment 	: "Brightness!"
					     			   , author		: "kershow@main.com"	   
					     		   },
					     		   {
					     			     stars 		: 3
					         		   , comment 	: "Good Device but performance, it's not enough"
					         		   , author		: "league@main.com"	   
					     		   }]
			  }];
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.products = gem;
	});
	
	app.controller('PanelController', function(){
		this.tab = 1;
		
		this.selectTab = function(setTab){
			this.tab = setTab;
		};
		this.isSelected = function(checkTab){
			return this.tab === checkTab;
		};
	});
	
	app.controller('ReviewController', function(){ 
		this.review = {};
		
		this.addReview = function(product){
			product.reviews.push(this.review);
			this.review = {};
		};
	});
	
})();



