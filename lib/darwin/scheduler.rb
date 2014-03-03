module Darwin
  class Scheduler    
    attr_reader :blocks, :teachers, :student_groups

    def self.find_viable_offspring(teachers, student_groups)
      new teachers, student_groups
    end

    def initialize(teachers, student_groups)
      @blocks         = Darwin::Block.new(student_groups)
      @teachers       = teachers
      @student_groups = student_groups
    end

    def generate_offspring
      @blocks
    end
  end
end