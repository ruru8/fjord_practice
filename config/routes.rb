Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users do
    member do
      get :following
      get :followers
    end
  end
  resources :books do 
    resources :comments, only: [:create, :destroy ]
  end
  resources :reports do
    resources :comments, only: [:create, :destroy ]
  end
  resources :relationships, only: [:create, :destroy]  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
