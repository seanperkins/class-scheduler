class Block < ActiveRecord::Base
  has_many :student_group_memberships
  has_many :teacher_memberships

  has_many :student_groups, through: :student_group_memberships
  has_many :teachers, through: :teacher_memberships

  belongs_to :schedule
end
