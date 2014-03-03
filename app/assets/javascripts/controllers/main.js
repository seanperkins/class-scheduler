(function() {'use strict';
angular.module('schedulerApp').
  controller('MainCtrl', ['$scope', 'schedules', 'teachers', 'student_groups',
              function ($scope, schedules, teachers, student_groups) {
    var date = new Date();
    date.setHours(9);
    date.setMinutes(10);
    date.setSeconds(0);

    $scope.days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    var calendar = [];
    for (var k = 0; k <= 185; k++) {
      calendar.push({
        day: $scope.days[Math.floor(k/37)],
        id: k,
        startTime: moment(date).format('h:mm')
      });
      if ((k+1)%37 === 0) {
        date.setHours(9);
        date.setMinutes(10);
      } else date.setTime(date.getTime()+600000);
    }

    $scope.calendar = calendar;

    $scope.sortableOptions = {
      start: function(e, ui) {
        $scope.$apply(function() { $scope.dragging = true; });
      },
      cursorAt: { left: 0, top: 0 },
      stop: function(e, ui) {
        $scope.$apply(function() { $scope.dragging = false; });

        _.each($('.slot'), function(slot) {
          if (ui.offset.top > $(slot).offset().top &&
              ui.offset.top < $(slot).offset().top+$(slot).height() &&
              ui.offset.left > $(slot).offset().left &&
              ui.offset.left < $(slot).offset().left+$(slot).width()) {
            $scope.$apply(function() {
              var slot_id = parseInt($(slot).find('.slot_id').html(), 10);
              var data = _.find($scope.calendar, function(data) {
                return data.id === slot_id;
              });

              var teacher_id = parseInt(ui.item.find('.teacher_id').html(), 10);
              var teacher = _.find($scope.teachers, function(teacher) {
                return teacher.id === teacher_id;
              });

              data.teacher = teacher;

              var nextSlot = $scope.calendar[$scope.calendar.indexOf(data)+1];
              if (nextSlot.day === data.day) nextSlot.teacher = teacher;
            });
          }
        });
      }
    };

    $scope.changeGroup = function (id) {
      if (id !== $scope.selected_student_group) {
        $scope.selected_student_group = id;
      }
    };

    teachers.fetch().then(function(response) {
      $scope.teachers = response.data.teachers;
    });

    student_groups.fetch().then(function(response) {
      $scope.student_groups = response.data.student_groups;
      $scope.selected_student_group = $scope.student_groups[0].id;
    });
  }]);
}());