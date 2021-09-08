# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    @train = Train.find(params[:id])
  end
end
