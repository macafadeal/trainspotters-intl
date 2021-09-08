class DashboardController < ApplicationController
  def show
    @train = Train.find(params[:id])
  end
end
