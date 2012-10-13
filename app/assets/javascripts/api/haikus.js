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

//nounApp.factory('Nouns', ['$resource', function(){}]);

nounApp.factory('Nouns', ['$resource', function($resource){
  return $resource('api/nouns.json', {}, {'index': {method:'GET', isArray: true } });
}]);


nounApp.controller('NounCtrl', ['$scope', 'Nouns', function($scope, Nouns){
    $scope.title = "Icon Library";
    
    var page = 1;
    $scope.nouns = [];
    $scope.loadMore = function(){
      console.log("Try to load more icons");
      Nouns.index({page: page}, 
        function(nouns){
          _.each(nouns, function(noun){
            $scope.nouns.push(noun);
          });
        });
      page += 1;
    };

    /*$scope.nouns = [{name:'Tacos',attribution:"Mexicans"},
                    {name:'Burger',attribution: "USA"},
                    {name:'Spongebob', attribution: "Crack"},
                    {name:'Sherlock',attribution:"England"},
                    {name:'Robot',attribution: "Chicken"}];*/
    //$scope.nouns = Nouns.index();
    // kick off the initial load
    $scope.loadMore();
    //$('#tagSelect').select2();  
}]);

