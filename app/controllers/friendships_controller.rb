class FriendshipsController < ApplicationController

	before_filter :setup_friends

	def create
		Friendship.request(@user,@friend)
		flash[:notice] = "Friend request sent"
		redirect_to users_path
	end

	private
	def setup_friends
		binding.pry
		@user = current_user
		@friend = User.find(params[:id])
	end
end
