searchFilter = angular.module('searchFilter', ['ngResource', 'ngRoute',])

searchFilter.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/products'
  $routeProvider.when '/products', templateUrl: '/templates/index.html.erb', controller: 'ProductsController'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
