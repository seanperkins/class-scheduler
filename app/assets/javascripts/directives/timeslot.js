(function() {'use strict';
  angular.module('schedulerApp').
    directive('csTimeSlot', ['$rootScope', function($rootScope) {
      return {
        replace: true,
        scope: {
          data: '=slot',
          dragging: '=',
          schedule: '='
        },
        templateUrl: '/assets/directives/timeslot.html',
        link: function(scope, elem, attrs) {
          scope.$watch('dragging', function(dragging) {
            if (dragging) {
              $('.slot').mouseenter(function(e) {
                $(this).addClass('dragover');
              });

              $('.slot').mouseleave(function(e) {
                $(this).removeClass('dragover');
              });
            } else {
              $('.slot').unbind('mouseenter mouseleave');
              $('.slot').removeClass('dragover');
            }
          });

          elem.mousedown(function(e) {
            if (elem.children('.teacher_id').html() !== '') {
              scope.startX = e.pageX;
              scope.startY = e.pageY;
              elem.parent().mousemove(function(e) {
                e.preventDefault();
                e.stopPropagation();
                var slotID = parseInt(elem.children('.slot_id').html(), 10);
                $rootScope.$emit('resize', scope.data, scope.startX, scope.startY, e.pageY);
              });
            }
          });

          elem.mouseup(function(e) {
            elem.parent().unbind('mousemove');
          });

          $rootScope.$on('resize', function(e, startData, startX, startY, currentY) {
            var slotID = parseInt(elem.children('.slot_id').html(), 10);
            if (startX > $(elem).offset().left &&
                startX < $(elem).offset().left+$(elem).width()) {
                if (slotID > startData.id && currentY > startY) {
                  if (currentY > $(elem).offset().top)
                    scope.$apply(function() { scope.data.teacher = startData.teacher; });
                  else if (scope.data.teacher === startData.teacher)
                    scope.$apply(function() { delete scope.data.teacher; });
                } else if (slotID < startData.id && currentY < startY) {
                  if (currentY < $(elem).offset().top + $(elem).height())
                    scope.$apply(function() { scope.data.teacher = startData.teacher; });
                  else if (scope.data.teacher === startData.teacher)
                    scope.$apply(function() { delete scope.data.teacher; });
                }
            }
          });
        }
      };
    }]);
}());
