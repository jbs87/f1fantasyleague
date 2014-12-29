class TransferMarketsController < ApplicationController
  skip_before_filter :require_login, only: [:index]
	def index
		
    @races = Race.races_with_results
    
    if params[:transfer_market]
      @current_round = Race.find(params[:transfer_market][:id]).round
    else
      @current_round = RaceResult.latest_round
    end

    @drivers_market = DriverMarket.where(round: @current_round).order(score: :desc)
    @selected_race_id = @races.where(round: @current_round).last.id if @current_round > 0


		# respond_to do |format|
  #   		format.html  # index.html.erb
  #   		format.js 
  #   	end
    end
end
