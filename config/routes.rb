Rails.application.routes.draw do
  root 'welcome#index'

  resources :routes
  resources :route_points, only: [:create, :update, :destroy]
  resources :blips
  resources :blip_images,  only: [:create, :destroy]
  resources :users
  resources :posts

  put  'blip_images' => 'blip_images#create'
  
  post 'update_route' => 'routes#update'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # API Data Routes
  post 'get_way_pts' => 'api#get_way_pts'
  post 'get_journeys' => 'api#get_journeys'

  # end API

  get 'ethan', to: redirect('users/1')
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
