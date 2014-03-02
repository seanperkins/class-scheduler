class Block < ActiveRecord::Base
  has_many :student_group_memberships
  has_many :teacher_memberships

  has_many :student_groups, through: :student_group_memberships
  has_many :teachers, through: :teacher_memberships

  belongs_to :schedule


  # Calculates when a block ends
  def end_time
    self.start_time + self.duration
  end

  def immutable?
    ret = false
    ret = true if self.teachers.length > 1 || self.student_groups.length > 1
    return ret
  end

  def day?
    case self.start_time
    when 0..37
      return 'Monday'
    when 38..74
      return 'Tuesday'
    when 75..111
      return 'Wednesday'
    when 112..148
      return 'Thursday'
    when 149..185
      return 'Friday'
  end
end
