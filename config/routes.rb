Rails.application.routes.draw do
  root 'welcome#index'

  resources :journeys
  resources :waypoints,        only: [:new, :create, :edit, :update, :destroy]
  resources :waypoint_images,  only: [:new, :create, :edit, :update, :destroy]
  resources :users,            only: [:new, :create, :update, :show, :destroy]
  resources :driftmap,         only: [:edit, :update, :destroy]

  put  'blip_images' => 'blip_images#create'  
  post 'update_route' => 'routes#update'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # API Data Routes
  post 'api_home' => 'api#home'
  post 'api_profile_page' => 'api#profile_page'
  post 'api_journey_edit' => 'api#journey_edit'
  # end API

  get 'ethan', to: redirect('users/1')
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
