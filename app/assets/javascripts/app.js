'use strict';

angular.module('schedulerApp', [
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.sortable'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/',
        controller: 'MainCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
