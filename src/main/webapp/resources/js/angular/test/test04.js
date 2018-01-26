(function(){
	var gem = [{
				name : 'MacBook Air'
			  , price : '1500.90'
			  },
			  {
				name : 'MacBook Pro'
			  , price : '3000.55'
			  },
			  {
				name : 'MacBook Pro Retina'
			  , price : '5000'
			  }];
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.products = gem;
	});
})();