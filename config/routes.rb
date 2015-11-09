Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,               only: [:create, :destroy]

=begin
  resources :posts do
    resources :comments
  end
=end
  
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'code'  => 'welcome#code'
  get 'about' => 'welcome#about'
  get 'photo' => 'welcome#photo'
end