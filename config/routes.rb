Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show]
  resources :books do 
    resources :comments, only: [:create, :destroy ]
  end
  resources :reports do
    resources :comments, only: [:create, :destroy ]
  end
  root to: 'books#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
