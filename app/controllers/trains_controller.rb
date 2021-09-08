class TrainsController < ApplicationController
  def index
    @trains = TrainEntry.all
  end

  def show
    @train = TrainEntry.find(params[:id])
  end

  def alphabetize
    @trains = TrainEntry.sort
  end
end
