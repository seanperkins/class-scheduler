class StudentGroupMembership < ActiveRecord::Base
  belongs_to  :block
  belongs_to  :student_group
end
