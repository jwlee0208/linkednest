(function(){
	var gem = {
				name : 'MacBook Air'
			  , price : '$1500'
			  };
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.product = gem;
	});
})();