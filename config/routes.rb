# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments, only: %i[create edit update], module: 'posts'
    resources :likes, only: %i[create destroy], module: 'posts'
  end
end
