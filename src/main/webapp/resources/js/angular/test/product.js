(function(){
	var app = angular.module('store-products',[]);
	
	// page include
	
	app.directive('productTitle', function(){
		return {
			restrict : 'E',
			templateUrl : '/angular/product-title.page'
		};
	});

	app.directive('productImages', function(){
		return {
			restrict : 'E',
			templateUrl : '/angular/product-images.page'
		};
	});

	app.directive('productPanels', function(){
		return {
			restrict : 'E',
			templateUrl : '/angular/product-panels.page',
			controller : function(){
				this.tab = 1;
				
				this.selectTab = function(setTab){
					this.tab = setTab;
				};
				this.isSelected = function(checkTab){
					return this.tab === checkTab;
				};
			},
			controllerAs: 'panels',
					
		};
	});

	app.directive('productDescription', function(){
		return {
			restrict : 'A',
			templateUrl : '/angular/product-description.page'
		};
	});

	app.directive('productSpecification', function(){
		return {
			restrict : 'A',
			templateUrl : '/angular/product-specification.page'
		};
	});

	app.directive('productReview', function(){
		return {
			restrict : 'E',
			templateUrl : '/angular/product-review.page'
		};
	});
	
	
})();