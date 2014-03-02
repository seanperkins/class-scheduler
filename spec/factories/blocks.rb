FactoryGirl.define do
  factory :block do
    duration    30
    start_time  1
    end_time    3
    immutable   false
    day         "Thursday"
  end
end