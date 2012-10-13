var nounApp = angular.module('NounApp', ['ngResource']);

nounApp.directive('whenScrolled', [function($scope){
  return function($scope, elm, attr){
    var raw = elm[0];
    elm.bind('scroll', function(){
      if(raw.scrollTop + raw.offsetHeight >= raw.scrollHeight){
        $scope.$apply(attr.whenScrolled);
      }
    });
  };
}]);

//nounApp.factory('Nouns', ['$resource']);

nounApp.controller('NounCtrl', ['$scope', function($scope){
    $scope.title = "Icon Library";
    $scope.nouns = [{name:'Tacos',attribution:"Mexicans"},
                    {name:'Burger',attribution: "USA"},
                    {name:'Spongebob', attribution: "Crack"},
                    {name:'Sherlock',attribution:"England"},
                    {name:'Robot',attribution: "Chicken"}];
}]);

