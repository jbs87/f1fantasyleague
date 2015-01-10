class FriendshipsController < ApplicationController

	before_filter :setup_friends
	respond_to :html, :js


	def create
		Friendship.request(@user,@friend)
		flash[:notice] = "Friend request sent"
	end

	def update
		if @user.requested_friends.include?(@friend)
			Friendship.accept(@user,@friend)
			flash[:notice] = "Friendship with #{@friend.name} accepted!"
		else
			flash[:notice] = "No friendship request from #{@friend.name}."
		end
	end

	# def cancel
	# 	binding.pry
	# 	if @user.requested_friends.include?(@friend)
	# 		Friendship.breakup(@user,@friend)
	# 		flash[:notice] = "Friendship with #{@friend.name} declined!"
	# 	else
	# 		flash[:notice] = "No friendship request from #{@friend.name}."
	# 	end
	# end

	def destroy
		Friendship.breakup(@user,@friend)
		flash[:notice] = "Friendship with #{@friend.name} deleted!"
		# redirect_to user_path(@current_user)
	end

	private
	def setup_friends
		@user = current_user
		@friend = User.find(params[:id])
	end
end
