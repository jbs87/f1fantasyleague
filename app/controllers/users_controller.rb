class UsersController < ApplicationController
  
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all.sort{ |x,y| y.current_score <=> x.current_score }
  end

  def show
    @user = current_user
    # binding.pry
    @current_team = @user.player_teams.last
    if @current_team 
      @new_team = @current_team
    else
      @new_team = PlayerTeam.new
      # can set new team default here.
    end

    @budget = @user.current_budget  #takes 2.0s
      # net_worth = 100,000,000 + (50,000 * player_score )
      # budget AKA money_on_hand = net_worth - value_of_of_player_team
      # caviat, the value_of_of_player_team, fluctuates.
    @score  = @user.current_score   #takes 0.3s

    @budget = @user.budget
    @score  = @user.score

    @driver_names = Driver.all
    @chassis_manufacturer = ChassisManufacturer.all
    @engines = Engine.all
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
