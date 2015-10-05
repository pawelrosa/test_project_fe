@app.factory('Answer', ['$resource', ($resource) ->
  $resource '/api/1/questions/:question_id/answers/:id', { question_id: '@question_id', id: '@id' }, {}
])