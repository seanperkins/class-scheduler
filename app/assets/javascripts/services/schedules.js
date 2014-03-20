(function() {'use strict';
  angular.module('schedulerApp').
    factory('schedules', ['$http', '$window', function($http, $window) {
      return {
        fetch: function(id) {
          return $http.get($window.API_URL+'schedules/'+id);
        },
        update: function(id, schedule) {
          return $http.put($window.API_URL+'schedules/'+id, {params: {schedule: schedule}});
        },
        insertBlock: function(schedule, block) {
          var output = [];
          var slots = [];

          //Resolve any block conflicts
          for (var k = 0; k < block.duration; k++) slots.push(block.start_position+k);
          _.each(schedule, function(oldBlock) {
            var oldSlots = [];
            for (var k = 0; k < oldBlock.duration; k++) oldSlots.push(oldBlock.start_position+k);
            if (_.intersection(slots, oldSlots).length > 0) {
              oldSlots = _.filter(oldSlots, function(slot) { return slot < slots[0]; });
              if (oldSlots.length > 0) {
                oldBlock.duration = oldSlots.length;
                output.push(oldBlock);
              }
            } else {
              output.push(oldBlock);
            }
          });

          //Add the block
          output.push(block);
          return output;
        }
      };
    }]);
}());
