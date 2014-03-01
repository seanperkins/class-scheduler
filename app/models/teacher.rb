class Teacher < ActiveRecord::Base
  has_many :teacher_memberships
  has_many :blocks, through: :teacher_memberships
end