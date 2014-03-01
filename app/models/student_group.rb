class StudentGroup < ActiveRecord::Base
  has_many :student_group_memberships
  has_many :blocks, through: :student_group_memberships
end
