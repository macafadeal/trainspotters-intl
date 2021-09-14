# frozen_string_literal: true

class TrainsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_train, only: [:show]

  def index
    @trains = Train.with_attached_photo.order(created_at: :desc)
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)
    @train.user = current_user
    if @train.save
      redirect_to train_path(@train), notice: "Train was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params
      .require(:train)
      .permit(:manufacturer, :series, :main_operator, :photo)
  end
end
