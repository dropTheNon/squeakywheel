Rails.application.routes.draw do
  get 'auth/failure'

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
  get 'complaint/new', to: 'complaints#new'
  post 'complaint/new', to: 'complaints#create'
  # get 'complaint/:id/edit', to: 'compalints#edit'
  # put 'complaint/:id/edit', to: 'complaints#update'
  get 'complaints', to: 'complaints#index'
  # get 'complaint/:id', to: 'complaints#show'
  # put 'complaint/:id', to: 'complaints#vote'
  # resources :complaints

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
