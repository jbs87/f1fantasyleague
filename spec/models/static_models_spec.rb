require 'spec_helper'

describe 'Static Tables needed to run the App' do
  before :each do
    @driver = Driver.find_by(driverId: 'rosberg')
    @constructor = ChassisManufacturer.find_by(constructorId: 'mercedes')
    @driver_market = DriverMarket.find_by(driver_id: 1)
    @engine = Engine.find_by(constructorId: 'red_bull')
    @race = Race.find_by(round: 1)
    @real_team = Realteam.find_by(id: 1)
    @score_overview = ScoringOverview.find_by(id: 1)
    @track = Track.find_by(circuitId: 'albert_park')
    @value_overview = ValueOverview.find_by(position: 1)
  end

  context'Driver Table' do

    it "should contain Nico Rosberg" do
      expect(@driver).to have_attributes(:name => "Nico Rosberg")
    end

  end

  context 'ChassisManufacturer Table' do
    
    it "should contain Mercedes GP" do
      expect(@constructor).to have_attributes(:name => "Mercedes GP Petronas F1")
    end
    
  end

  context 'DriverMarket Table' do
    
    it "should have a value of 50_000_000" do
      expect(@driver_market).to have_attributes(:value => 50_000_000)
    end
    
  end

  context 'Engine Table' do
    
    it "should have the Red Bull engine" do
      expect(@engine).to have_attributes(:name => 'Red Bull - Renault')
    end
    
  end

  context 'Race Table' do
    
    it "should have Australia as round 1" do
      expect(@race).to have_attributes(:name => 'Albert Park Grand Prix Circuit')
    end
    
  end

  context 'Realteam Table' do
    
    it "should have drivers on same team" do
      expect(@real_team).to have_attributes(:driver1_id => 1, :driver2_id => 2)
    end
    
  end

  context 'ScoringOverview Table' do
    
    it "should have a score for driver_race" do
      expect(@score_overview).to have_attributes(:driver_race => 100)
    end
    
  end

  context 'Track Table' do
    
    it "should have a score for driver_race" do
      expect(@track).to have_attributes(:country => 'Australia')
    end
    
  end

  context 'ValueOverview Table' do
    
    it "should have a value for position 1" do
      expect(@value_overview).to have_attributes(:driver_race => 9_000_000)
    end
    
  end
end
