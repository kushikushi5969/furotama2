Rails.application.routes.draw do
  root to: "tops#index"

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  namespace :admin do
    resources :restaurants, only: [:index, :new, :create, :show,  :edit, :destroy]
  end

  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :mypages, only: [:show, :destroy] do
    member do
      get :following, :followers
    end
  end

  resources :searches, only: [:index]
  get 'random', to: 'searches#random_search'

  resources :notifications, only: [:index]
end
