Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]

  get 'login', to: 'sessions#new'

  delete 'logout', to: 'sessions#destroy'

  root 'posts#index'
end
