class TeacherMembership < ActiveRecord::Base
  belongs_to :block
  belongs_to :teacher
end