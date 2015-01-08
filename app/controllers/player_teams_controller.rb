class PlayerTeamsController < ApplicationController
  def create
    @player_team = PlayerTeam.new(player_team_params)
    @player_team.user_id = current_user.id
    @player_team.race_id = Race.current_race.id
    if @player_team.save
      redirect_to user_path(current_user), notice: 'Team Created'
    else
      flash.now[:alert] = 'Create Team Failed'
      render '/users/show'
    end
    
  end

  def update
    @player_team = PlayerTeam.find(params[:id])
    @player_team.race_id = Race.current_race.id
    if @player_team.change_team(player_team_params)
      redirect_to user_path(current_user), notice: 'Team Updated'
    else
      redirect_to user_path(current_user), notice: 'Team NOT Updated'
    end
    
  end

  def index
  end

  private

  def player_team_params
    params.require(:player_team).permit(:driver1_id, :driver2_id, :chassis_manufacturer_id,:engine_id)
  end
end
