(function(){
	var gem = [{
				name : 'MacBook Air'
			  , price : '$1500'
			  , description : 'This one is ...............'	  
			  , purchase : true // false : 버튼 hide	  
			  },
			  {
				name : 'MacBook Pro'
			  , price : '$3000'
			  , description : 'This one is too expensive...............'	  
			  , purchase : true // false : 버튼 hide	  
			  }];
	var app = angular.module('store',[]);
	
	app.controller('StoreController', function(){
		this.products = gem;
	});
})();