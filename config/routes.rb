Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  # resource :myprofile, only: [:new, :create]
  get '/profile', to: 'myprofile#new'
  post '/profile', to: 'myprofile#create'
  get '/my_profile', to: 'myprofile#show' , as: 'show_my_profile'

  root 'home#index'
  get '/upload_image', to: 'myprofile#upload_image', as: 'upload_image'
  # post '/upload_image', to: 'myprofile#upload_image', as: 'upload_image'
  get '/feed', to: 'myprofile#feed' , as: 'feed'
  post '/feed', to: 'myprofile#create_image', as: 'create_image'

  resources :friend_requests, only: [:index, :new, :create, :show, :update, :destroy]
  resources :group_chats, only: [:index, :show, :new, :create]

  resources :messages
  mount ActionCable.server, at: '/cable'

  resources :group_chats do
    resources :messages
  end


end
