Rails.application.routes.draw do

  get 'profiles/:id' => 'profiles#show', as: :profile
  get 'profiles' => 'profiles#index'

  devise_for :users
  resources :tweets

  root 'tweets#index'

end
