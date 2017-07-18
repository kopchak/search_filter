angular.module('searchFilter').factory 'Product', ($resource, $http) ->

  class Task
    constructor: (taskListId, errorHandler) ->
      @service = $resource('/api/products/filter',
        {task_list_id: taskListId, id: '@id'},
        {update: {method: 'PATCH'}}
      )

      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    search: (attrs) ->
      new @service(task: attrs).$save ((task) -> attrs.id = task.id)
      attrs
