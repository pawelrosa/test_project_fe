'use strict'

@app.controller('AllQuestionsCtrl', ['$scope', '$filter', 'Question', 'newQuestionModal', ($scope, $filter, Question, newQuestionModal) ->
  $scope.orderProp = '-created_at'
  $scope.followed = ''
  $scope.questionsLimit = 5

  Question.get({limit: $scope.questionsLimit}).$promise.then(
    (data) ->
      $scope.more = data.more
      $scope.collection = data.response
      $scope.questions = $scope.collection
    ,
    (error) -> console.log 'error', error
  )

  $scope.order = (orderProp) ->
    $scope.orderProp = orderProp

  $scope.search = ->
    $scope.questions = $filter('filter')($scope.collection, { head: $scope.query })

  $scope.loadMoreQuestions = ->
    limit = $scope.questionsLimit += 5
    Question.get({limit: limit}).$promise.then(
      (data) ->
        $scope.more = data.more
        $scope.collection = data.response
        $scope.questions = $scope.collection
    ,
      (error) -> console.log 'error', error
    )

  $scope.addQuestion = ->
    newQuestionModal.open($scope.questions)

])