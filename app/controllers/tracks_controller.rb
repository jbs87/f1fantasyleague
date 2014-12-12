class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def show
  end
end
