require 'spec_helper'

describe Darwin::Scheduler do
  let!(:teacher1)        { create(:teacher, :subject => 'Art') }
  let!(:teacher2)        { create(:teacher, :subject => 'PE') }
  let!(:student_group1)  { create(:student_group, :grade => 'preK')}
  let!(:student_group2)  { create(:student_group, :grade => '2')}

  let(:block1)           { create(:block)}
  let(:block2)           { create(:block)}
  let(:block3)           { create(:block)}
  let(:block4)           { create(:block)}
  let(:block5)           { create(:block)}
  let(:block6)           { create(:block)}
  let(:block7)           { create(:block)}
  let(:block8)           { create(:block)}
  let(:block9)           { create(:block)}
  let(:block10)          { create(:block)}


  describe "#initialize" do
    subject { described_class.new(
      [block1, block2, block3, block4, block5, block6, block7, block8, block9, block10], 
      [teacher1, teacher2], 
      [student_group1, student_group2]
    )}

    it "should create a valid object" do
      subject.class.should == Darwin::Scheduler
    end
  end

  describe "find_viable_offspring" do

    let(:schedule) {{
      name: "blah",
      blocks: [
        {
          start_time:    0,
          duration:      2,
          teacher:       teacher1,
          student_group: student_group1
        },
        {
          start_time:    0,
          duration:      2,
          teacher:       teacher2,
          student_group: student_group2
        },
        {
          start_time:    2,
          duration:      2,
          teacher:       teacher1,
          student_group: student_group1
        },
        {
          start_time:    2,
          duration:      2,
          teacher:       teacher2,
          student_group: student_group2
        },
        {
          start_time:    4,
          duration:      2,
          teacher:       teacher1,
          student_group: student_group1
        },
        {
          start_time:    4,
          duration:      2,
          teacher:       teacher2,
          student_group: student_group2
        },
        {
          start_time:    6,
          duration:      2,
          teacher:       teacher1,
          student_group: student_group1
        },
        {
          start_time:    6,
          duration:      2,
          teacher:       teacher2,
          student_group: student_group2
        },
        {
          start_time:    8,
          duration:      2,
          teacher:       teacher1,
          student_group: student_group1
        },
        {
          start_time:    8,
          duration:      2,
          teacher:       teacher2,
          student_group: student_group2
        }
      ]
    }}

    subject { described_class.find_viable_offspring(
      [block1, block2, block3, block4, block5, block6, block7, block8, block9, block10], 
      [teacher1, teacher2], 
      [student_group1, student_group2]
    )}

    

    it "should provide best schedule based off of our requirements and restrictions" do
      subject.generate_offspring.should == [block1, block2, block3, block4, block5, block6, block7, block8, block9, block10]
    end
  end
end