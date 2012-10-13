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
nounApp.factory('Tags', ['$resource', function($resource){
  return $resource('api/tags.json', {}, {'index': {method:'GET', isArray: true }});
}]);

nounApp.controller('NounCtrl', ['$scope', 'Nouns', 'Tags', function($scope, Nouns, Tags){
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
      /*$('#library li.tile').draggable({
        connectToSortable: ".haikuLine",
        helper: "clone",
        revert: "invalid"
      });*/
      page += 1;
    };


    // kick off the initial load
    
    $('#tagSelect').select2({tags:["red", "green"]});  
    $scope.loadMore();
}]);

