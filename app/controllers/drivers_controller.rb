class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id].to_i)
    respond_to do |format|

    format.html # show.html.erb
    format.json { render json: @driver }

 end
  end

end
