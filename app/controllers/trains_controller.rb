# frozen_string_literal: true

class TrainsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_train, only: %i[show edit update destroy]

  PER_PAGE = 12

  def index
    @trains = policy_scope(Train)
      .includes(:user, photo_attachment: :blob)
      .where.associated(:photo_attachment)
      .order(created_at: :desc)
      .page(params[:page])
      .per(PER_PAGE)
  end

  def new
    @train = Train.new
    authorize @train
  end

  def create
    @train = Train.new(train_params)
    @train.user = current_user
    authorize @train
    if @train.save
      redirect_to train_path(@train), notice: "Train was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @train
  end

  def edit
    authorize @train
  end

  def update
    authorize @train
    if @train.update(train_params)
      redirect_to train_path(@train), notice: "Train was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @train
    @train.destroy!
    redirect_to trains_path, notice: "Train was successfully deleted."
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
