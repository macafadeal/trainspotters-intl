# frozen_string_literal: true

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
    @train = Train.new(params_set)
    @train.user = current_user
    redirect_to trains_path if @train.save
  end

  def params_set
    params.require(:train).permit(:manufacturer, :series, :main_operator)
  end
end
