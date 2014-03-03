module Darwin
  module Blocks
    class BlockCollection
      include Enumerable

      delegate :each, :count, :to => :blocks

      def initialize(student_groups)
        @student_groups = student_groups
      end

      private

      def blocks
        @blocks ||= @student_groups.map do |student_group|
          REQUIREMENTS.keys.each do |key|
            
          end
          ::Darwin::Blocks::Block.new
        end.flatten
      end
    end
  end
end