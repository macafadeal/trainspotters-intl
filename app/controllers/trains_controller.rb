# frozen_string_literal: true

class TrainsController < ApplicationController
  def index
    @trains = Train.all
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(params_set)
    @train.user = current_user
    redirect_to train_path(@train) if @train.save
  end

  def show
    @train = Train.find(params[:id])
  end

  def params_set
    params
      .require(:train)
      .permit(:manufacturer, :series, :main_operator, :photo)
  end

  def users_id
    @train.user
  end
end
