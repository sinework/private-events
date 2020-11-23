Rails.application.routes.draw do
  # get 'events/new'
  # get 'events/index'
  # get 'events/show'
  # get 'events/destroy'
root to: 'events#index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/destroy'
  # get 'users/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'signup' => 'users#new'
get '/login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'
resources :users
resources :events, only: [:index, :new, :show, :destroy]
end
