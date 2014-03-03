require 'spec_helper'

describe "An anonymous user" do
  describe "visits homepage" do
    
    it "should see welcome message" do
      visit "/"

      page.should have_content "Calendar"
    end
  end
end