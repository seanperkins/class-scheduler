(function() {'use strict';
  angular.module('schedulerApp').
    factory('calendar', ['$http', '$window', function($http, $window) {
      var calendar;

      return {
        create: function(days) {
          //Could definitely add more configuration parameters to calendar config
          var date = new Date();
          date.setHours(9);
          date.setMinutes(10);
          date.setSeconds(0);

          calendar = [];
          for (var k = 0; k <= 185; k++) {
            calendar.push({
              day: days[Math.floor(k/37)],
              id: k,
              startTime: moment(date).format('h:mm')
            });
            if ((k+1)%37 === 0) {
              date.setHours(9);
              date.setMinutes(10);
            } else date.setTime(date.getTime()+600000);
          }

          return calendar;
        },
        update: function(schedule, selected_student_group, teachers) {
          _.each(calendar, function(slot) {
            delete slot.block;
            delete slot.teacher;
          });

          _.each(schedule, function(block) {
            if (selected_student_group !== undefined &&
                _.contains(block.student_group_ids, selected_student_group.id)) {
              for (var k = block.start_position; k < block.start_position + block.duration; k++) {
                var slot = calendar[k];
                slot.block = block;
                if (teachers !== undefined) {
                  slot.teacher = _.find(teachers, function (teacher) {
                    return _.contains(block.teacher_ids, teacher.id);
                  });
                }
              }
            }
          });
        }
      };
    }]);
}());