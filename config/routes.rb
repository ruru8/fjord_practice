Rails.application.routes.draw do
  devise_for :users
  resources :books do 
    resources :comments, only: [:create, :destroy ]
  end
  resources :reports do
    resources :comments, only: [:create, :destroy ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
