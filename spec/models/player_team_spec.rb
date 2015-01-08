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
      
      primary_driver   = Driver.find_by(name: 'Kamui Kobayashi')
      secondary_driver = Driver.find_by(name: 'Marcus Ericsson')
      constructor      = ChassisManufacturer.find_by(name: 'Lotus F1 Team')
      engine           = Engine.find_by(name: 'Toro Rosso - Renault')

      @player_team = @user.player_teams.last
      @player_team.change_team({
                                        driver1_id: primary_driver.id,
                                        driver2_id: secondary_driver.id,
                                        engine_id: engine.id,
                                        chassis_manufacturer_id: constructor.id})

    end
    
    it "should have same net worth" do
      expect(@player_team.budget).to eq(15_000_000)
    end
  end
end