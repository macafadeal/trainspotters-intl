# frozen_string_literal: true

Rails
  .application
  .routes
  .draw do
    devise_for :users

    root to: "pages#home"

    resources :trains, only: %i[index show new create edit update destroy]
  end
