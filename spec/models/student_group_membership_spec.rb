require 'spec_helper'

describe StudentGroupMembership do
  it { should belong_to(:block) }
  it { should belong_to(:student_group) }
end
