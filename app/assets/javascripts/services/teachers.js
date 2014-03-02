(function() {'use strict';
  angular.module('schedulerApp').
    factory('teachers', ['$http', '$window', function($http, $window) {
      return {
        fetch: function() {
          return $http.get($window.API_URL+'teachers');
        }
      };
    }]);
}());