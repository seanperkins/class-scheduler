require 'spec_helper'

describe StudentGroup do
  it { should have_many(:student_group_memberships) }
  it { should have_many(:blocks) }
end