@app.controller 'NewAnswerCtrl', ['$scope', '$modalInstance', '$state', 'authorId', 'Answer', 'question', ($scope, $modalInstance, $state, authorId, Answer, question) ->

  $scope.dismiss = -> $scope.$dismiss()

  $scope.save = ->
    Answer.save(
      answer:
        question_id: question.id
        parent_id: null
        body: $scope.answerBody
        author_id: authorId
      ,
      question_id: question.id
    ).$promise.then(
      (data) ->
        #question = data.response
        $scope.dismiss()
      (error) ->
        console.log error
    )

]