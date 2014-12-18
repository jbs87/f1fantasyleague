require 'spec_helper'

describe User do
	it "should authenticate with matching username and password" do
		user = create(:user, password_confirmation: "app")
	end
end