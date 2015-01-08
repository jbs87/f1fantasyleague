require 'spec_helper'

describe PlayerTeam do
  before :each do
    @user = User.create(name: "Homer Simpson", email: "h.simpson@test.com",password: "test", password_confirmation: "test")
    
  end
  describe "for round 0" do

    it "should have a score of zero" do
      expect(@user.score).to eq(0)   
    end
  
    it "should have a budget og 100M" do
      expect(@user.budget.to eq(100_000_000))
    end

  end
end