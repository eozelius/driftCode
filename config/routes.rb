Rails.application.routes.draw do
  root 'welcome#index'

  resources :users

  resources :posts, only: [:create, :update, :destroy]


  get  'driftmap' => 'driftmap#wizard'
  post 'driftmap' => 'driftmap#update'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end