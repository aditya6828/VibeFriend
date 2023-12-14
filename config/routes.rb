Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  # resource :myprofile, only: [:new, :create]
  get '/profile', to: 'myprofile#new'
  post '/profile', to: 'myprofile#create'
  get '/my_profile', to: 'myprofile#show' , as: 'show_my_profile'

  root 'home#index'

end
