(function() {'use strict';
angular.module('schedulerApp')
  .controller('MainCtrl', ['$scope', 'schedules', 'teachers', 'student_groups',
              function ($scope, schedules, teachers, student_groups) {
    var date = new Date();
    date.setHours(9);
    date.setMinutes(10);
    date.setSeconds(0);

    $scope.days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    var schedule = [];
    for (var k = 0; k <= 185; k++) {
      schedule.push({
        day: $scope.days[Math.floor(k/37)],
        id: k,
        startTime: moment(date).format('h:mm'),
        style: {
          'border': '1px solid grey',
          'background-color': 'white'
        }
      });
      if ((k+1)%37 === 0) {
        date.setHours(9);
        date.setMinutes(10);
      } else date.setTime(date.getTime()+600000);
    }

    $scope.schedule = schedule;

    $scope.sortableOptions = {
      start: function(e, ui) {
        $('.slot').mouseenter(function(e) {
          var id = parseInt($(this).find('.slot_id').html(), 10);
          $scope.$apply(function() {
            $scope.schedule[id].style.border = '2px solid red';
          });
        });

        $('.slot').mouseleave(function(e) {
          var id = parseInt($(this).find('.slot_id').html(), 10);
          $scope.$apply(function() {
            $scope.schedule[id].style.border = '1px solid grey';
          });
        });
      },
      cursorAt: { left: 0, top: 0 },
      stop: function(e, ui) {
        $('.slot').unbind('mouseenter');

        _.each($('.slot'), function(slot) {
          if (ui.offset.top > $(slot).offset().top && ui.offset.top < $(slot).offset().top+$(slot).height() &&
              ui.offset.left > $(slot).offset().left && ui.offset.left < $(slot).offset().left+$(slot).width()) {
            var id = parseInt($(slot).find('.slot_id').html(), 10);
            $scope.$apply(function() {
              $scope.schedule[id].style['background-color'] = 'black';
            });
          }
        });
      }
    };

    teachers.fetch().then(function(response) {
      $scope.teachers = response.data.teachers;
    });

    student_groups.fetch().then(function(response) {
      $scope.student_groups = response.data.student_groups;
    });
  }]);
}());