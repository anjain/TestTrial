angular.module('trialApp').controller "NewListController", ($scope, $timeout, $routeParams, List, $location) ->

  $scope.initList = () ->
    @listService = new List(serverErrorHandler)

  $scope.createList = (content) ->
    @listService.create content: content, (list) ->
        $location.url("/dashboard")

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")