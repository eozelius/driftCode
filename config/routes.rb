Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    resources :driftmap, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:create, :update, :destroy]

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # API requests
  post 'api/create_driftmap' => 'api#create_driftmap'


  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end