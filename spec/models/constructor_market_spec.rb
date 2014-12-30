require 'spec_helper'

describe ConstructorMarket do
  before :each do
    @constructor = ChassisManufacturer.find_by(constructorId: 'mclaren')
    @constructor.constructor_markets.create!({round: 0,value: 40_000_000,score: 0})
    @driver_button    = Driver.find_by(driverId: 'button')
    @driver_magnussen = Driver.find_by(driverId: 'kevin_magnussen')

    @round_zero = ConstructorMarket.where(round: 0).last
  end

  context'Constructor ( chassis manufacturer )' do
    
    describe "At start of season (round 0)" do
      it "should have a score of zero" do
        expect(@round_zero.score).to be(0) 
      end

      it "should have starting value of 40M" do
        expect(@round_zero.value).to be(40_000_000)
      end

    end

    describe "After 1st round, with Button and Magnussen" do
      before :each do
        @constructor.race_results.create({driver_id: @driver_button.id   , engine_id: 1, race_id: 1, race_pos: 3, qualifying_pos: 11})
        @constructor.race_results.create({driver_id: @driver_magnussen.id, engine_id: 1, race_id: 1, race_pos: 2, qualifying_pos: 4})
        @constructor_round_one = @constructor.constructor_markets.where(round: 1).last
      end

      it "should have total score of 70" do
        expect(@constructor_round_one.score).to eq(70)
      end

      it "should have total value of 44.5M" do
        expect(@constructor_round_one.value).to eq(44_500_000)
      end

      describe "After 2nd round, qualifying 2nd and finishing 2nd" do
        before :each do
          @constructor.race_results.create({driver_id: @driver_button.id   , engine_id: 1, race_id: 2, race_pos: 6, qualifying_pos: 10})
          @constructor.race_results.create({driver_id: @driver_magnussen.id, engine_id: 1, race_id: 2, race_pos: 9, qualifying_pos: 8})
          @constructor_round_two = @constructor.constructor_markets.where(round: 2).last
        end

        it "should have a score of 105" do
          expect(@constructor_round_two.score).to eq(109)
        end

        it "should have total value of 46.250M" do
          expect(@constructor_round_two.value).to eq(46_250_000)
        end

      end
    
    end

    describe "Maximum and minimum value capped" do
      it "maximum value is 150M" do
        over_max = ConstructorMarket.create({chassis_manufacturers_id: 1, round: 1, value: 150_000_001, score: 0})
        expect(over_max.value).to eq(150_000_000)
      end

      it "mainimum value is 2M" do
        under_min = ConstructorMarket.create({chassis_manufacturers_id: 1, round: 1, value: 1_999_999, score: 0})
        expect(under_min.value).to eq(2_000_000)
      end
    end

  end
end
