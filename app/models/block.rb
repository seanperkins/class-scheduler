class Block < ActiveRecord::Base
  has_many :student_group_memberships
  has_many :teacher_memberships

  has_many :student_groups, through: :student_group_memberships
  has_many :teachers, through: :teacher_memberships

  belongs_to :schedule

  before_validation :check_for_overlap, message: "This block overlaps another"

  # Calculates when a block ends
  def end_time
    self.start_time + self.duration
  end

  def occupied_times
    ot = []
    self.start_time.upto self.duration do |i|
      ot << i
    end
    return ot
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

  private
    def check_for_overlap
      if student_groups.present?
        student_groups.each do |sg|
          sg.blocks.each do |b|
            overlap = self.occupied_times & b.occupied_times
            return false if overlap.length > 0
          end
        end
      end
      if teachers.present?
        teachers.each do |t|
          t.blocks.each do |b|
            overlap = self.occupied_times & b.occupied_times
            return false if overlap.length > 0
          end
        end
      end
    end
end
