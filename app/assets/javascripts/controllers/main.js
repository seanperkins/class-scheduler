(function() {'use strict';
angular.module('schedulerApp').
  controller('MainCtrl', ['$scope', 'schedules', 'teachers', 'student_groups', 'calendar',
              function ($scope, schedules, teachers, student_groups, calendar) {
    $scope.days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    $scope.calendar = calendar.create($scope.days);

    var updateCalendar = function() {
      calendar.update($scope.schedule, $scope.selected_student_group, $scope.teachers);
    };

    $scope.$watch('selected_student_group', updateCalendar);
    $scope.$watchCollection('[teachers, student_groups]', updateCalendar);
    $scope.$watch('schedule', function() {
      if ($scope.schedule !== undefined) {
        updateCalendar();
        schedules.update(SCHEDULE_ID, $scope.schedule);
      }
    }, true);

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

              var duration = (data.id < $scope.calendar.length-1 &&
                              data.day === $scope.calendar[data.id+1].day) ? 2 : 1;
              var teacher_id = parseInt(ui.item.find('.teacher_id').html(), 10);
              var block = {
                start_position: data.id,
                duration: duration,
                teacher_ids: [teacher_id],
                student_group_ids: [$scope.selected_student_group.id]
              };

              $scope.schedule = schedules.insertBlock($scope.schedule, block);
            });
          }
        });
      }
    };

    $scope.changeGroup = function (group) {
      if (group !== $scope.selected_student_group) {
        $scope.selected_student_group = group;
      }
    };

    teachers.fetch().then(function (response) {
      $scope.teachers = response.data.teachers;
    });

    student_groups.fetch().then(function (response) {
      $scope.student_groups = response.data.student_groups;
      $scope.selected_student_group = $scope.student_groups[0];
    });

    schedules.fetch(SCHEDULE_ID).then(function (response) {
      $scope.schedule = response.data.blocks;
    });
  }]);
}());
