'use strict'

@app.controller('SingleQuestionCtrl', ['$scope', '$stateParams', 'Question', '$http', ($scope, $stateParams, Question, $http) ->

  Question.get({id: $stateParams.id}).$promise.then(
    (data) ->
      $scope.question = data.response
  ,
    (error) -> console.log 'error', error
  )

  $scope.upvote = (question) ->
    console.log('upvote', question.id)
    $http.put("/api/1/questions/#{question.id}/upvote")
      .success (data) -> $scope.question = data.response
      .error (error) -> console.log 'error', error

  $scope.downvote = (question) ->
    console.log('downvote', question.id)
    $http.put("/api/1/questions/#{question.id}/downvote")
      .success (data) -> $scope.question = data.response
      .error (error) -> console.log 'error', error

])