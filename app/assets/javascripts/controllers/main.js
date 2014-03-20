(function() {'use strict';
angular.module('schedulerApp').
  controller('MainCtrl', ['$scope', 'schedules', 'teachers', 'student_groups',
              function ($scope, schedules, teachers, student_groups) {
    var createCalendar = function() {
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
          startTime: moment(date).format('h:mm'),
          student_group: $scope.selected_student_group
        });
        if ((k+1)%37 === 0) {
          date.setHours(9);
          date.setMinutes(10);
        } else date.setTime(date.getTime()+600000);
      }

      $scope.calendar = calendar;
    };

    createCalendar();

    var resolveBlockConflicts = function(block) {
      if (typeof(block) !== 'undefined') {
        var output = [];
        var slots = [];
        for (var k = 0; k < block.duration; k++) slots.push(block.start_position+k);
        _.each($scope.schedule, function(oldBlock) {
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

        output.push(block);
        $scope.schedule = output;
      }
    };

    var updateCalendar = function() {
      _.each($scope.calendar, function(slot) {
        delete slot.block;
        delete slot.teacher;
      });

      _.each($scope.schedule, function(block) {
        if ($scope.selected_student_group !== undefined &&
            _.contains(block.student_group_ids, $scope.selected_student_group.id)) {
          for (var k = block.start_position; k < block.start_position + block.duration; k++) {
            var slot = $scope.calendar[k];
            slot.block = block;
            if ($scope.teachers !== undefined) {
              slot.teacher = _.find($scope.teachers, function (teacher) {
                return _.contains(block.teacher_ids, teacher.id);
              });
            }
          }
        }
      });
    };

    $scope.$watch('selected_student_group', updateCalendar);
    $scope.$watchCollection('[teachers, student_groups]', updateCalendar);
    $scope.$watch('schedule', function() {
      if ($scope.schedule !== undefined) {
        resolveBlockConflicts();
        updateCalendar();
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
                student_group_ids: [$scope.selected_student_group]
              };

              resolveBlockConflicts(block);
              $scope.schedule.push(block);
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

    teachers.fetch().then(function (response) {
      $scope.teachers = response.data.teachers;
    });

    student_groups.fetch().then(function (response) {
      $scope.student_groups = response.data.student_groups;
      $scope.selected_student_group = $scope.student_groups[0];
    });

    schedules.fetch().then(function (response) {
      $scope.schedule = [{
        start_position: 1,
        duration: 3,
        teacher_ids: [7],
        student_group_ids: [4]
      }];
    });
  }]);
}());
