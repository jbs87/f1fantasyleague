class RacesController < ApplicationController
  def index
  	@race = Race.all
  end

  def show
  end
end
