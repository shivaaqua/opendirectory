
root = global ? window

TodosIndexCtrl = ($scope, Todo) ->
  $scope.todos = Todo.query()

  $scope.save = ->
    todo = Todo.save $scope.todo
    $scope.todos.push(todo)

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @todo
      @todo.destroy ->
        $scope.todos = _.without($scope.todos, original)

TodosIndexCtrl.$inject = ['$scope', 'Todo'];

TodosCreateCtrl = ($scope, $location, Todo) ->
  $scope.save = ->
    Todo.save $scope.todo, (todo) ->
      $location.path "/todos/#{todo.id}/edit"

TodosCreateCtrl.$inject = ['$scope', '$location', 'Todo'];

TodosShowCtrl = ($scope, $location, $routeParams, Todo) ->
  Todo.get
    id: $routeParams.id
  , (todo) ->
    @original = todo
    $scope.todo = new Todo(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.todo.destroy ->
        $location.path "/todos"

TodosShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Todo'];

TodosEditCtrl = ($scope, $location, $routeParams, Todo) ->
  Todo.get
    id: $routeParams.id
  , (todo) ->
    @original = todo
    $scope.todo = new Todo(@original)

  $scope.isClean = ->
    console.log "[TodosEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.todo

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.todo.destroy ->
        $location.path "/todos"

  $scope.save = ->
    Todo.update $scope.todo, (todo) ->
      $location.path "/todos"

TodosEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Todo'];

# exports
root.TodosIndexCtrl  = TodosIndexCtrl
root.TodosCreateCtrl = TodosCreateCtrl
root.TodosShowCtrl   = TodosShowCtrl
root.TodosEditCtrl   = TodosEditCtrl