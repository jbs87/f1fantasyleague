require 'spec_helper'

describe User do
	before :each do
    # @user = User.new "Jack", "jack@temp.com", :category
    @user =  User.new({ name: 'Homer', email: 'homer@powerplant.nuke', password: 'a', password_confirmation: 'a'})
		@user2 = User.new({ name: 'Marge', email: 'marge@powerplant.nuke', password: 'b', password_confirmation: 'b'})
	end

  describe "#index" do
    
  end

	describe "#new" do
		it "takes parameters and returns a User object" do
			expect(@user).to be_an_instance_of User
		end
	end
end