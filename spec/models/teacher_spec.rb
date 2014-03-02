require 'spec_helper'

describe Teacher do
  it { should have_many(:teacher_memberships) }
  it { should have_many(:blocks) }
end
