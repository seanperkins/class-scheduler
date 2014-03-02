(function() {'use strict';
angular.module('schedulerApp')
  .controller('MainCtrl', ['$scope', 'schedule', 'teachers', 'student_groups',
              function ($scope, schedule, teachers, student_groups) {
    var calendar = [];
    _.each(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], function(day) {
      var slots = [];
      var date = new Date();
      date.setHours(9);
      date.setMinutes(10);
      date.setSeconds(0);
      for (var k = 0; k <= 36; k++) {
        slots.push({
          id: k,
          startTime: moment(date).format('h:mm')
        });
        date.setTime(date.getTime()+600000);
      }

      calendar.push({
        title: day,
        slots: slots
      });
    });

    $scope.calendar = calendar;
        
    $scope.sortableOptions = {
      stop: function(e, ui) {
        console.log(ui.offset.top+' '+ui.offset.left);
        _.each($('.slot'), function(slot) {
          if (ui.offset.top > $(slot).offset().top && ui.offset.top < $(slot).offset().top+$(slot).height() &&
              ui.offset.left > $(slot).offset().left && ui.offset.left < $(slot).offset().left+$(slot).width()) {
            $(slot).attr('style', 'background-color: black');
          }
        });
      }
    };

    teachers.fetch().then(function(response) {
      $scope.teachers = response.data.teachers;
    });
  }]);
}());