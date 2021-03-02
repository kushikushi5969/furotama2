Rails.application.routes.draw do
  root to: "tops#index"

  # devise_for :users, controllers: {
  #   passwords: 'users/passwords',
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }
  # devise_scope :user do
  #   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  # end
end
