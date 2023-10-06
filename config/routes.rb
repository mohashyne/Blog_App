# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'
  resources :users, only: [:index, :show, :destroy] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end