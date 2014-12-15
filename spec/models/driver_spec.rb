require 'spec_helper'

describe Driver do
	before :each do
    # @user = User.new "Jack", "jack@temp.com", :category
    @driver =  Driver.new({ name: 'Nico Rosberg', price: 50000000, driverId: 'rosberg'})
    @track = Track.new({circuitId:'australia'})
	@race = Race.new({ date: DateTime.new(2014,03,16,8,0,0), track_id: , password: 'b', password_confirmation: 'b'})
	end

  describe "#index" do
    
  end

	describe "#new" do
		it "takes parameters and returns a User object" do
			expect(@user).to be_an_instance_of User
		end
	end
end