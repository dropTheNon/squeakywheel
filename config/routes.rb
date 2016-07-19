Rails.application.routes.draw do


  # Main controller routes for homepage
  root 'main#index'

  # Routes for OmniAuth-Facebook
  get 'auth/:provider/callback', to: 'auth#callback'
  get 'auth/failure', to: 'auth#failure'
  get 'auth/logout', to: 'auth#logout'#, as: 'logout'

  # User controller routes
  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'
  get 'user/:id', to: 'user#show'
  get 'user/:id/edit', to: 'user#edit'
  put 'user/:id/edit', to: 'user#update'

  # Session controller routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Company controller routes
  # get 'companies', to: 'company#index'
  # get 'company/:id', to: 'company#show'
  # get 'search/', to: 'company#search'
  # get 'company/results', to: 'company#results'
  resources :company

  # Complain controller routes
  get 'complaints', to: 'complaints#index'
  get 'complaints/data'
  put 'complaints', to: 'complaints#upvote'
  get 'complaint/new', to: 'complaints#new'
  post 'complaint/new', to: 'complaints#create'
  get 'complaint/:id/edit', to: 'complaints#edit'
  put 'complaint/:id/edit', to: 'complaints#update'
  # get 'complaint/:id', to: 'complaints#show'
  # put 'complaint/:id', to: 'complaints#vote'
  # resources :complaints

  # Action mailer password reset
  get 'auth/failure'

  get 'reset' => 'passwords#new'
  post 'reset' => 'passwords#create'
  get 'reset/:code' => 'passwords#edit', as: :reset_code
  put 'reset/:code' => 'passwords#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
