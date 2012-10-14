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
/*
 $('#library li.tile').draggable({
      
    });
*/

nounApp.directive('draggable', function() {
  return {
    restrict:'A',
    link:function(scope,element,attrs){
      element.draggable({
        connectToSortable: ".haikuLine",
        helper: "clone",
        revert: "invalid"
      });
    }
  };
});

nounApp.factory('Nouns', ['$resource', function($resource){
  return $resource('api/nouns.json', {}, {'index': {method:'GET', isArray: true } });
}]);
nounApp.factory('Tags', ['$resource', function($resource){
  return $resource('api/tags.json', {}, {'index': {method:'GET', isArray: true }});
}]);

nounApp.controller('NounCtrl', ['$scope', 'Nouns', 'Tags', function($scope, Nouns, Tags){
    var page = 1;
    $scope.nouns = [];
    $scope.tags = [];
    $scope.loadMore = function(tags){
      //console.log("Try to load more icons");
      console.log(tags);
      Nouns.index({
          page: page,
          tags: tags
        }, 
        function(nouns){
          _.each(nouns, function(noun){
            $scope.nouns.push(noun);
          });
        });
      page += 1;
    };
    $scope.loadTags = function(){
      console.log("Loading tags");
      Tags.index({}, function(tags){
        _.each(tags, function(tag){
          //console.log(tag.name)
          $scope.tags.push(tag.name);
        });
      });
    };

    $('#tagSelect').on('change', function(){
      console.log("tags updated");
      // reset page position
      page = 1
      $scope.nouns = [];
      $scope.$apply();
      var input_tags = $('#tagSelect').val().split(",");
      //var params = $.param(array={tags: input_tags});
      //console.log($.param(array={tags: input_tags}));
      $scope.loadMore(input_tags);
      // query loadMore with tag list
      //console.log($('#tagSelect'));
    })
    
    var dfd = $.Deferred();
    dfd.done(
            $scope.loadMore("Hello"),
            $scope.loadTags(),
            $('#tagSelect').select2({tags:$scope.tags})
    );
}]);

