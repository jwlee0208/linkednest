(function(){
	var gem = [{
				name   	: 'MacBook Air'
			  , price  	: '1500.90'
			  , images 	: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
			  			 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  },
			  {
				name 	: 'MacBook Pro'
			  , price 	: '3000.55'
			  , images 	: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
			  },
			  {
				name 	: 'MacBook Pro Retina'
			  , price 	: '5000'
			  , images 	: [{big : '/img/test/macbook01.jpg', small : '/img/test/macbook02.jpg'}
		  			 	 , {big : '/img/test/macbook03.jpg', small : '/img/test/macbook04.jpg'}]   
				  
			  }];
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.products = gem;
	});
})();