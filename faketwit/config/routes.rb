Rails.application.routes.draw do

  devise_for :users
  resources :tweets
  resources :relationships

  get 'profiles/:id' => 'profiles#show', as: :profile
  get 'profiles' => 'profiles#index'
  root 'tweets#index'

end
