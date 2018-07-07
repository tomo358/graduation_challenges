Rails.application.routes.draw do
  devise_for :users
  root 'musical_instruments#index'

  resources :musical_instruments

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
