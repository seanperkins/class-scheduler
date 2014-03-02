require 'spec_helper'

describe TeacherMembership do
  it { should belong_to(:block) }
  it { should belong_to(:teacher) }
end