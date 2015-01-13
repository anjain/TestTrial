trialApp = angular.module('trialApp', ['ngResource', 'ngRoute', 'mk.editablespan', 'ui.sortable'])

trialApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

trialApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/dashboard'
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/lists/new', templateUrl: '/templates/newlist.html', controller: 'NewListController'
  $routeProvider.when '/lists/:list_id', templateUrl: '/templates/list.html', controller: 'ListController'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
