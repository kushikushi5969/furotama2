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
    # collection do
    #   get 'get_area_children', defaults: { format: 'json' }
    # end
    # collection do
    #   get ':id/get_area_children', to: 'posts#get_area_children', defaults: { format: 'json' }
    # end
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
