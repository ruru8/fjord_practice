# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :users, only: [:index, :show] do
    resources :followees, only: [:index], module: "users"
    resources :followers, only: [:index], module: "users"
  end
  resources :books do
    resources :comments, only: [:create, :destroy ]
  end
  resources :reports do
    resources :comments, only: [:create, :destroy ]
  end
  resources :followings, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
