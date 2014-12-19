require 'spec_helper'
require "pry"

describe User do
	it "should authenticate with matching username and password" do
		user = create(:user, password_confirmation: "app")
		race = create(:race)
		User.authenticate("a@goop.com","app").should == user 
	end
end

#binding.pry
