class UsersController < ApplicationController
  
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    @user = current_user
    # binding.pry
    @current_team = @user.player_teams.last
    if @current_team && @current_team.updateable?
      @new_team = @current_team
    else
      @new_team = PlayerTeam.new
      # can set new team default here.
    end

    # @budget = 350000 # @user.budget
    # @score = @user.total_score
    end
  
  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:users, notice: 'User was successfully created')
    else
      render 'new'
    end

  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
