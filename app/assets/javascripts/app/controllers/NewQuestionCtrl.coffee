@app.controller 'NewQuestionCtrl', ['$scope', '$modalInstance', 'Question', '$state', 'authorId', ($scope, $modalInstance, Question, $state, authorId) ->

  $scope.dismiss = -> $scope.$dismiss()

  $scope.save = ->
    Question.save(
      question:
        head: $scope.questionHead
        body: $scope.questionBody
        author_id: authorId
    ).$promise.then(
      (data) ->
        $state.go('question', {id: data.response.id})
        $scope.dismiss()
      (error) ->
        console.log error
    )

]