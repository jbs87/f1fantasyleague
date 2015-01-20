require 'spec_helper'

describe PlayerTeam do
  before :each do
    @user = User.create(name: "Homer Simpson", email: "h.simpson@test.com",password: "test", password_confirmation: "test")
  end
  describe "for round 0" do
    before :each do
        
    end

    it "should have a score of zero" do
      expect(@user.score).to eq(0)   
    end
  
    it "should have a budget of 14M with default team" do
      expect(@user.budget).to eq(14_000_000)
    end

    it "should have a team_value" do
      player_team = @user.player_teams.last
      team_value = 0
      team_value = team_value + DriverMarket.find_by(id: player_team.driver1_id).value
      team_value = team_value + DriverMarket.find_by(id: player_team.driver2_id).value
      team_value = team_value + ConstructorMarket.find_by(id: player_team.chassis_manufacturer_id).value
      team_value = team_value + ConstructorMarket.find_by(id: player_team.engine_id).value
      
      expect(team_value).to eq(86_000_000)

    end

  end

  describe "when team changes" do
    before :each do
      
      @primary_driver   = Driver.find_by(name: 'Kamui Kobayashi')
      @secondary_driver = Driver.find_by(name: 'Marcus Ericsson')
      @engine           = Engine.find_by(name: 'Toro Rosso - Renault')
      @constructor      = ChassisManufacturer.find_by(name: 'Lotus F1 Team')

      @player_team = @user.player_teams.last
      @player_team.change_team({
                                        driver1_id: @primary_driver.id,
                                        driver2_id: @secondary_driver.id,
                                        engine_id:  @engine.id,
                                        chassis_manufacturer_id: @constructor.id})

    end
    
    it "should have same net worth" do
      expect(@player_team.budget).to eq(15_000_000)
    end

    it "should have a new team" do
      expect(@player_team.driver1_id).to eq(@primary_driver.id)
      expect(@player_team.driver2_id).to eq(@secondary_driver.id)
      expect(@player_team.engine_id).to eq(@engine.id)
      expect(@player_team.chassis_manufacturer_id).to eq(@constructor.id)
    end
  end

  describe "when RaceResults recorded" do
    before :each do
      @primary_driver     = Driver.find_by(name: 'Max Chilton')
      @secondary_driver   = Driver.find_by(name: 'Marcus Ericsson')
      @constructor_driver = Driver.find_by(name: 'Adrian Sutil')
      @engine_driver      = Driver.find_by(name: 'Romain Grosjean')

      @primary_driver.race_results.create(    {chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
      @secondary_driver.race_results.create(  {chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
      @constructor_driver.race_results.create({chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
      @engine_driver.race_results.create(     {chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
      
      PlayerTeam.update_after_new_race_results
    end

    it "should increase score" do
      # @player_team = @user.player_teams.where(race_id: 1).last
      # expect(@player_team.score).to eq(2)
      
    end

    it "should increase budget 50K per point scored in race." do
      
    end
    
  end
end