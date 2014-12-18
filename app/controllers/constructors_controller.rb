class ConstructorsController < ApplicationController
  def show
    @constructor = ChassisManufacturer.find(params[:id].to_i)
      respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @constructor }
    end
  end
end
