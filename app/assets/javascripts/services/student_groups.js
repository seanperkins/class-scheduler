(function() {'use strict';
  angular.module('schedulerApp').
    factory('student_groups', ['$http', '$window', function($http, $window) {
      return {
        fetch: function() {
          return $http.get($window.API_URL+'student_groups');
        }
      };
    }]);
}());