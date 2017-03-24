Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index] do
  	resources :posts, only: [:index]
  end

  resources :posts, except: [:index] do
    resources :comments, only: [:index, :new, :create]
  end

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :comments, except: [:index, :new, :create]

  root 'posts#index'
end
