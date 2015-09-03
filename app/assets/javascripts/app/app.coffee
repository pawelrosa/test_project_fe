@app = angular.module('app', [
  'ui.router'
])

@app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $stateProvider
  .state('root', {
      url: '/',
      controller: 'AllQuestionsCtrl',
      templateUrl: '/assets/app/templates/all_questions.html'
    })

