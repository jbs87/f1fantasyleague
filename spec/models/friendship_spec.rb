require 'spec_helper'

describe Friendship do
	before :each do
		@user = create(:user,name: "Homer", password_confirmation: "app")
		@friend = create(:user,name: "Harold",email: "as", password_confirmation: "app")
	end

	it "Friend request should set status correctly" do
		Friendship.request(@user,@friend)
		expect(assert_status(@user,@friend, 'pending')).to be(true)
		expect(assert_status(@friend,@user, 'requested')).to be(true)
	end

	it "Friend request accepted" do
		Friendship.request(@user,@friend)
		Friendship.accept(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(true) 
		expect(assert_status(@user,@friend, 'accepted')).to be(true) 
		expect(assert_status(@friend,@user, 'accepted')).to eq(true) 
	end

	it "Friends breakup" do
		Friendship.request(@user,@friend)
		Friendship.accept(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(true) 
		Friendship.breakup(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(false) 
	end

	private
	def assert_status(user,friend , status)
		friendship = Friendship.find_by(user: user, friend: friend)
		status==friendship.status
	end


end