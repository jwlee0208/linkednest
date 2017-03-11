(function(){
	var gem = [{
				name   			: 'MacBook Air'
			  , price  			: '1500.90'
			  , images 			: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
			  			 	 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]  
			  , description 	: "It's very thin. When you carry on it to somewhere, make to feel like a 'air'!!!"
			  , specification 	: "OS X included"
			  , review : "gorgeous"	  
			  },
			  {
				name 			: 'MacBook Pro'
			  , price 			: '3000.55'
			  , images 			: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 		 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  , description 	: "It's thin more than older!!!"
			  , specification 	: "OS X included"
			  , review 			: "nice performance"	  			  
			  },
			  {
				name 	: 'MacBook Pro Retina'
			  , price 	: '5000'
			  , images 	: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  , description 	: "It's thin more than older!!!"
			  , specification 	: "OS X included"
			  , review 			: "nice view"				  
			  }];
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.products = gem;
	});
})();



