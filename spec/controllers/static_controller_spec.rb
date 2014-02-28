require 'spec_helper'

describe StaticController do
  describe "visit to home" do
    it "should display welcome message" do
      get :landing_page

      response.status.should == 200
    end
  end
end
