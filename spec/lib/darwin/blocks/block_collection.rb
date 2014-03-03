require 'spec_helper'

describe Darwin::Blocks::BlockCollection do
  let(:student_group)  { create(:student_group) }
  let(:student_group2) { create(:student_group) }

  describe "#init" do
    subject { described_class.new([student_group, student_group2]) }

    it "should init 6 blocks" do
      binding.pry  
      subject.count.should == 6
    end
  end
end