(function() {'use strict';
  angular.module('schedulerApp').
    factory('schedules', ['$http', '$window', function($http, $window) {
      return {
        fetch: function(id) {
          return $http.get($window.API_URL+'schedules');
        }
      };
    }]);
}());
