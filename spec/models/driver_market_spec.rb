require 'spec_helper'

describe DriverMarket do
  before :each do
    @driver = Driver.find_by(name: 'Nico Rosberg')
    @driver.driver_markets.create!({round: 0,value: 50_000_000,score: 0})
    @round_zero = DriverMarket.where(round: 0).last
  end

  context'Driver' do

    describe "At start of season (round 0)" do
      it "should have a score of zero" do
        expect(@round_zero.score).to be(0) 
      end

      it "should have starting value of 50M" do
        expect(@round_zero.value).to be(50_000_000)
      end

    end

    describe "After 1st round, finishing 1st in qualifying and the race" do
      before :each do
        @driver.race_results.create({chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
        @driver_round_one = @driver.driver_markets.where(round: 1).last
      end

      it "should have total score of 130 points." do
        expect(@driver_round_one.score).to eq(130)
      end

      it "should have total value of 59M" do
        expect(@driver_round_one.value).to eq(59_000_000)
      end

      describe "After 2nd round, qualifying 2nd and finishing 2nd" do
        before :each do
          @driver.race_results.create({chassis_manufacturer_id: 1, engine_id: 1, race_id: 2, race_pos: 2, qualifying_pos: 2})
          @driver_round_two = @driver.driver_markets.where(round: 2).last
        end

        it "should have a score of 230" do
          expect(@driver_round_two.score).to eq(230)
        end

        it "should have total value of 67M" do
          expect(@driver_round_two.value).to eq(67_000_000)
        end

      end

    end

    describe "If finishing 17th in qualifying and the race" do
      before :each do
        @driver.race_results.create({chassis_manufacturer_id: 1, engine_id: 1, race_id: 1, race_pos: 17, qualifying_pos: 17})
        @driver_round_one = @driver.driver_markets.where(round: 1).last
      end

      it "should have total score of 7 points." do
        expect(@driver_round_one.score).to be(7)
      end

      it "should have total value of 48M" do
        expect(@driver_round_one.value).to be(48_000_000)
      end

    end

    describe "Maximum and minimum value capped" do
      it "maximum value is 150M" do
        driver_market = DriverMarket.create({driver_id: 1, round: 1, value: 150_000_001, score: 0})
        expect(driver_market.value).to eq(150_000_000)
      end

      it "mainimum value is 2M" do
        driver_market = DriverMarket.create({driver_id: 1, round: 1, value: 1_999_999, score: 0})
        expect(driver_market.value).to eq(2_000_000)
      end
    end

  end

end