root = global ? window

angular.module("todos", ["ngResource"]).factory "Todo", ['$resource', ($resource) ->
  Todo = $resource("/todos/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Todo::destroy = (cb) ->
    Todo.remove
      id: @id
    , cb

  Todo
]
root.angular = angular
