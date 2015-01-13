angular.module('trialApp').controller "DashboardController", ($scope, $routeParams, $location, List) ->

  $scope.init = ->
    @listsService = new List(serverErrorHandler)
    $scope.lists = @listsService.all()



  $scope.deleteList = (list, index) ->
    result = confirm "Are you sure you want to remove this list?"

    if result
      @listsService.delete list
      $scope.lists.splice index, 1

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
