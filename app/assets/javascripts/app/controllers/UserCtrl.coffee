'use strict'

@app.controller('UserCtrl', ['$scope', '$stateParams', 'User', ($scope, $stateParams, User) ->

  User.get({id: $stateParams.id}).$promise.then(
    (data) ->
      $scope.user = data.response
  ,
    (error) -> console.log 'error', error
  )
])