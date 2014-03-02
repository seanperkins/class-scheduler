require 'spec_helper'

describe Schedule do
  describe "valid schedule" do
    subject { described_class.new(name: "great schedule of 2014") }

    it "should have a name" do
      subject.name.should == "great schedule of 2014"
    end
  end
end
