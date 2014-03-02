require 'spec_helper'

describe Block do
  let!(:teacher)         { create(:teacher) }
  let!(:student_group)   { create(:student_group)}
  let(:subject)          { create(:block, :teachers => [teacher], :student_groups => [student_group])}

  it "contains valid attributes" do
    subject.teachers.should       == [teacher]
    subject.student_groups.should == [student_group]
  end
end