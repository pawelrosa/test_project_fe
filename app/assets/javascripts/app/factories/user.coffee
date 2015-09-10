@app.factory('User', ['$resource', ($resource) ->
  $resource '/api/1/users/:id', { id: '@id' },
    update:
      method: 'PUT'
    reviews:
      method: 'GET'
      params:
        reviews_only: true
      isArray: true
])