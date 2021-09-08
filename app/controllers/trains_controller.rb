class TrainsController < ApplicationController
  def index
    @trains = Train.all
  end

  def show
    @train = Train.find(params[:id])
  end

  def alphabetize
    @trains = Train.sort
  end

  def new
    @train = Train.new
  end

  def create
    raise
  end
end
