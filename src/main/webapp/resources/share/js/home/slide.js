(function(){
	
	var app = angular.module('website', ['ngAnimate', 'ngTouch']);
	

	
    app.controller('MainCtrl', function ($scope, $timeout) {
        
    	$scope.slides = [
    	                 {image: '/img/home/img00.jpg', description: 'Image 00'},
    	                 {image: '/img/home/img01.jpg', description: 'Image 01'},
    	                 {image: '/img/home/img02.jpg', description: 'Image 02'},
    	                 {image: '/img/home/img03.jpg', description: 'Image 03'},
    	                 {image: '/img/home/img04.jpg', description: 'Image 04'},
    	                 {image: '/img/home/img05.jpg', description: 'Image 05'}
    	             ];

        $scope.direction = 'left';
        $scope.currentIndex = 0;

        $scope.setCurrentSlideIndex = function (index) {
            $scope.direction = (index > $scope.currentIndex) ? 'left' : 'right';
            $scope.currentIndex = index;
        };

        $scope.isCurrentSlideIndex = function (index) {
            return $scope.currentIndex === index;
        };

        $scope.prevSlide = function () {
            $scope.direction = 'left';
            $scope.currentIndex = ($scope.currentIndex < $scope.slides.length - 1) ? ++$scope.currentIndex : 0;
        };

        $scope.nextSlide = function () {
            $scope.direction = 'right';
            $scope.currentIndex = ($scope.currentIndex > 0) ? --$scope.currentIndex : $scope.slides.length - 1;
        };
        
		/* Start: auto slide show */
		
		var timer;
		
		var sliderFunc=function(){
			timer=$timeout(function(){
				$scope.nextSlide();
				timer=$timeout(sliderFunc,5000);
			},5000);
		};
		
		sliderFunc();
		
		$scope.$on('$destroy',function(){
			$timeout.cancel(timer);
		});
		
		/* End : auto slide show */          
    })
    .animation('.slide-animation', function () {
        return {
            beforeAddClass: function (element, className, done) {
                var scope = element.scope();

                if (className == 'ng-hide') {
                    var finishPoint = element.parent().width();
                    if(scope.direction !== 'right') {
                        finishPoint = -finishPoint;
                    }
                    TweenMax.to(element, 0.5, {left: finishPoint, onComplete: done });
                }
                else {
                    done();
                }
            },
            removeClass: function (element, className, done) {
                var scope = element.scope();

                if (className == 'ng-hide') {
                    element.removeClass('ng-hide');

                    var startPoint = element.parent().width();
                    if(scope.direction === 'right') {
                        startPoint = -startPoint;
                    }

                    TweenMax.fromTo(element, 0.5, { left: startPoint }, {left: 0, onComplete: done });
                }
                else {
                    done();
                }
            }
        };
    });

//    app.run(function($rootScope, $timeout, MainCtrl){
//    	
//    	$timeout(function(){
//    		MainCtrl.nextSlide();
//    	}, 3000);
//    	
//    });
	
})();
