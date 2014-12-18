class EnginesController < ApplicationController
  def show
    @engine = Engine.find(params[:id].to_i)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @engine }
    end
  end
end
