'use strict'

@app.controller('SingleQuestionCtrl', ['$scope', '$stateParams', 'Question', '$http', ($scope, $stateParams, Question, $http) ->

  Question.get({id: $stateParams.id}).$promise.then(
    (data) ->
      $scope.question = data.response
  ,
    (error) -> console.log 'error', error
  )

  $scope.upvote = (item, itemType, parent={}) ->
    url = "/api/1/questions/#{$stateParams.id}/"
    switch itemType
      when 'Question' then url += "upvote"
      when 'Answer' then url += "answers/#{item.id}/upvote"
      when 'Comment' then url += "answers/#{parent.id}/comments/#{item.id}/upvote"
    $http.put(url)
      .success (data) -> $scope.question = data.response
      .error (error) -> console.log 'error', error

  $scope.downvote = (item, itemType, parent={}) ->
    url = "/api/1/questions/#{$stateParams.id}/"
    switch itemType
      when 'Question' then url += "downvote"
      when 'Answer' then url += "answers/#{item.id}/downvote"
      when 'Comment' then url += "answers/#{parent.id}/comments/#{item.id}/downvote"
    $http.put(url)
    .success (data) -> $scope.question = data.response
    .error (error) -> console.log 'error', error

])