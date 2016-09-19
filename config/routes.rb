Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :posts
  resources :blips, only: :destroy

  post   '/update_route' => 'posts#update_route'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'ethan', to: redirect('users/1')
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
