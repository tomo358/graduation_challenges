Rails.application.routes.draw do
  root 'tops#index'

  resources :musical_instruments do
    collection do
      post :confirm
    end
    post :share
  end

  resources :favorites, only: [:create, :destroy]
  resources :mypages, only: [:show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
