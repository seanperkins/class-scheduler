module ScheduleGuideline
  REQUIREMENTS = {
    :FLES  => {
      "K" => { :duration => 'week', :minimum => 90,  :maximum => 90},
      "1" => { :duration => 'week', :minimum => 125, :maximum => 130},
      "2" => { :duration => 'week', :minimum => 125, :maximum => 130},
      "3" => { :duration => 'week', :minimum => 125, :maximum => 130},
      "4" => { :duration => 'week', :minimum => 125, :maximum => 130},
      "5" => { :duration => 'week', :minimum => 125, :maximum => 130}
    },
    :Art   => {
      "preK" => { :duration => 'week', :minimum => 30,  :maximum => 45},
      "K" => { :duration => 'week', :minimum => 45,  :maximum => 50},
      "1" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "2" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "3" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "4" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "5" => { :duration => 'week', :minimum => 60, :maximum => 60}
    },
    :Music => {
      "preK" => { :duration => 'week', :minimum => 30,  :maximum => 45},
      "K" => { :duration => 'week', :minimum => 60,  :maximum => 60},
      "1" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "2" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "3" => { :duration => 'week', :minimum => 60, :maximum => 60},
      "4" => { :duration => 'week', :minimum => 45, :maximum => 60},
      "5" => { :duration => 'week', :minimum => 45, :maximum => 60}
    },
    :PE    => {
      "preK" => { :duraction => 'day', :minimum => 20,  :maximum => 20, :times => 2 },
      "K" => { :duraction => 'day', :minimum => 20,  :maximum => 20, :times => 2 },
      "1" => { :duraction => 'day', :minimum => 20,  :maximum => 20, :times => 2 },
      "2" => { :duraction => 'day', :minimum => 20,  :maximum => 20, :times => 2 },
      "3" => { :duraction => 'day', :minimum => 30,  :maximum => 30, :times => 3 },
      "4" => { :duraction => 'day', :minimum => 30,  :maximum => 30, :times => 3 },
      "5" => { :duraction => 'day', :minimum => 30,  :maximum => 30, :times => 3 }
    }
  }
end