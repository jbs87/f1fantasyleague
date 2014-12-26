require 'spec_helper'

describe DriverMarket do
  before :each do

  end

  describe "should be zero for round 0" do
    @round_zero = DriverMarket.where(round: 0).last
    puts @round_zero.score

    # expect(@round_zero.score).to be(0) 
  end

  describe "#new" do
    it "takes parameters and returns a User object" do
      expect(@user).to be_an_instance_of User
    end
  end
end