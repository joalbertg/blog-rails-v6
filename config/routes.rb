# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :articles do
    collection do
      get 'user/:user_id', to: 'articles#from_author'
    end
  end
end
