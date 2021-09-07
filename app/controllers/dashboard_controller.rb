class DashboardController < ApplicationController
  def show
    @train = TrainEntry.find(params[:id])
  end
end
