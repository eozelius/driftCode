Rails.application.routes.draw do
  root 'welcome#index'

  resources :routes,       only: [:create, :destroy]
  resources :route_points, only: [:create, :update, :destroy]
  resources :blips,        only: [:create, :destroy]
  resources :blip_images,  only: [:create, :destroy]
  resources :users
  resources :posts

  post 'update_route' => 'routes#update'
  post 'update_blip' => 'blips#update'
  put  'blip_images' => 'blip_images#create'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'ethan', to: redirect('users/1')
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
