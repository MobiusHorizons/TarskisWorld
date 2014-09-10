angular.module('TarskisWorld',[])
.controller('sentences', ['$scope',function($scope){
   $scope.sentences = 
       [
       
       {val: "RightOf(a)"},
       {val: "LeftOf(a)"}
   ];
    $scope.addSentence = function(){
        $scope.sentences.push({val:""});
    }
}])