(function() {'use strict';
  angular.module('schedulerApp').
    factory('teachers', ['$http', function($http) {
      return {
        fetch: function(id) {
          return $http.get('http://0.0.0.0:3000/api/v1/teachers');
        }
      };
    }]);
}());