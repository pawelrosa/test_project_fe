'use strict'

@app.controller('AllQuestionsCtrl', ['$scope', ($scope) ->
  $scope.questions = [
    { "head": "head 1", "body": "Body 1"},
    { "head": "head 2", "body": "Body 2"}
  ]
])