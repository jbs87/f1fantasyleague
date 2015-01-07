require 'spec_helper'

describe Friendship do
	before :each do
		@user = create(:user,name: "Homer", password_confirmation: "app")
		@friend = create(:user,name: "Harold",email: "as", password_confirmation: "app")
	end

	it "Friend request should set status correctly" do
		Friendship.request(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(true) 
	end

	it "Friend request accepted" do
		Friendship.request(@user,@friend)
		Friendship.accept(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(true) 
		expect(Friendship.find_by(user: @user, friend: @friend).status).to eq('accepted') 
		expect(Friendship.find_by(user: @friend, friend: @user).status).to eq('accepted') 
	end

	it "Friends breakup" do
		Friendship.request(@user,@friend)
		Friendship.accept(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(true) 
		Friendship.breakup(@user,@friend)
		expect(Friendship.exists?(@user,@friend)).to be(false) 
	end


end