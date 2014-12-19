class RacesController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]
  def index
  	@races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end
end
