(function() {'use strict';
  angular.module('schedulerApp').
    directive('csTimeSlot', function() {
      return {
        replace: true,
        scope: {
          data: '=slot',
          dragging: '='
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
        }
      };
    });
}());