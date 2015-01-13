angular.module('trialApp').controller "ListController", ($scope, $timeout, $routeParams, List, $location) ->

  $scope.init = () ->
    @listService = new List(serverErrorHandler)

    $scope.list = @listService.find $routeParams.list_id


  $scope.listContentEdited = (listContent) ->
    @listService.update(@list, content: listContent)
    $location.url("/dashboard")

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

