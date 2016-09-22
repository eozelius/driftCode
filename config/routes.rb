Rails.application.routes.draw do
  root 'welcome#index'

  resources :routes,       only: [:create, :update, :destroy]
  resources :route_points, only: [:create, :update, :destroy]
  resources :blips,        only: [:create, :update, :destroy]
  resources :blip_images,  only: [:create, :update, :destroy]
  resources :users
  resources :posts

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'ethan', to: redirect('users/1')
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
