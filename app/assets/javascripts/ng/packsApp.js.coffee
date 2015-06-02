"use strict"

@packsApp = angular.module "packsApp", ['ngRoute']

@packsApp.config ($routeProvider) ->
  $routeProvider
    .when '/packs',
      templateUrl: "assets/packs/index.html"
      controller: "PacksController"
    .otherwise redirectTo: '/packs'

@packsApp.controller 'PacksController', ($scope, $http) ->
  $http.get('/packs.json').success( (response) ->
    step = 3
    $scope.rows = (response.slice(i,i+step) for i in [0..response.length] by step)
  ).error( (response)->
    alert "we lose"
  )

