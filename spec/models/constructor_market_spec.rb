require 'spec_helper'

describe ConstructorMarket do
  before :each do
    @constructor = ChassisManufacturer.find_by(constructorId: 'red_bull')
    @constructor.constructor_markets.create!({round: 0,value: 61_750_000,score: 0})
    @round_zero = ConstructorMarket.where(round: 0).last
  end

  context'Constructor ( chassis manufacturer )' do
    
    describe "At start of season (round 0)" do
      it "should have a score of zero" do
        expect(@round_zero.score).to be(0) 
      end

      it "should have starting value of 61_750_000" do
        expect(@round_zero.value).to be(61_750_000)
      end

    end

    describe "After 1st round, finishing 1st in qualifying and the race" do
      before :each do
        @constructor.race_results.create({driver_id: 1, engine_id: 1, race_id: 1, race_pos: 1, qualifying_pos: 1})
        @constructor_round_one = @constructor.constructor_markets.where(round: 1).last
      end

      it "should have total score of 60" do
        expect(@constructor_round_one.score).to eq(60)
      end

      it "should have total value of 64_750_000" do
        expect(@constructor_round_one.value).to eq(64_750_000)
      end

      describe "After 2nd round, qualifying 2nd and finishing 2nd" do
        before :each do
          @constructor.race_results.create({driver_id: 1, engine_id: 1, race_id: 2, race_pos: 2, qualifying_pos: 2})
          @constructor_round_two = @constructor.constructor_markets.where(round: 2).last
        end

        it "should have a score of 105" do
          expect(@constructor_round_two.score).to eq(105)
        end

        it "should have total value of 67_250_000" do
          expect(@constructor_round_two.value).to eq(67_250_000)
        end

      end
    
    end

  end
end
