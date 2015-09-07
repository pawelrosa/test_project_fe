@app = angular.module('app', [
  'ui.router',
  'ngResource'
])

@app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/questions'
  $stateProvider
  .state('questions', {
      url: '/questions',
      controller: 'AllQuestionsCtrl',
      templateUrl: '/assets/app/templates/all_questions.html'
    })
  .state('question', {
      url: '/questions/:id',
      controller: 'SingleQuestionCtrl',
      templateUrl: '/assets/app/templates/single_question.html'
    })

