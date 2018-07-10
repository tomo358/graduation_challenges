Rails.application.routes.draw do
  root 'tops#index'

  resources :musical_instruments do
    collection do
      post :confirm
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
