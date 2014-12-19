class TransferMarketsController < ApplicationController
  skip_before_filter :require_login, only: [:index]
	def index
		if params[:transfer_market]
			@race = Race.find(params[:transfer_market][:id])
      # @round = Race.find(params[:transfer_market][:id]).round
			@round = @race.round
		else
			@race = Race.last
		end
		# respond_to do |format|
  #   		format.html  # index.html.erb
  #   		format.js 
  #   	end
    end
end
