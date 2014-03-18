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
            if (scope.data.block !== undefined) {
              $rootScope.$apply(function() {
                $rootScope.selectedBlock = scope.data.block;
                $rootScope.initialStartPosition = scope.data.block.start_position;
                $rootScope.initialDuration = scope.data.block.duration;
              });
              scope.startX = e.pageX;
              scope.startY = e.pageY;
              elem.parent().mousemove(function(e) {
                e.preventDefault();
                e.stopPropagation();
                $rootScope.$emit('resize', scope.startX, scope.startY, e.pageY);
              });
            }
          });

          elem.mouseup(function(e) {
            elem.parent().unbind('mousemove');
          });

          $rootScope.$on('resize', function(e, startX, startY, currentY) {
            if (startX > $(elem).offset().left &&
                startX < $(elem).offset().left+$(elem).width() &&
                currentY > $(elem).offset().top &&
                currentY < $(elem).offset().top+$(elem).height()) {

                scope.$apply(function() {
                  if (scope.data.id > $rootScope.initialStartPosition) {
                    $rootScope.selectedBlock.duration =
                      scope.data.id-$rootScope.initialStartPosition+1;
                  } else {
                    $rootScope.selectedBlock.duration =
                      $rootScope.initialDuration+$rootScope.initialStartPosition-scope.data.id;
                    $rootScope.selectedBlock.start_position = scope.data.id;
                  }
                });
            }
          });
        }
      };
    }]);
}());
