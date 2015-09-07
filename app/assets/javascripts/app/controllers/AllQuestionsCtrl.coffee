'use strict'

@app.controller('AllQuestionsCtrl', ['$scope', 'Question', ($scope, Question) ->
  $scope.orderProp = '-created_at'

  Question.get().$promise.then(
    (data) ->
      $scope.questions = data.response
    ,
    (error) -> console.log 'error', error
  )

  $scope.order = (orderProp) ->
    $scope.orderProp = orderProp

])