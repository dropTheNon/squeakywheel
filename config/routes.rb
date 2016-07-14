Rails.application.routes.draw do
  root 'main#index'

  get 'signup', to: 'user#new'

  post 'signup', to: 'user#create'

  get 'profile', to: 'user#show'

  get 'user/edit', to: 'user#edit'

  # put 'user#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
