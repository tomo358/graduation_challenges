Rails.application.routes.draw do
  root 'musical_instruments#index'

  resources :musical_instruments

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
