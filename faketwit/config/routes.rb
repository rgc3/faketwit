Rails.application.routes.draw do

  devise_for :users

  resources :tweets do
    resource :like
  end
# This is a nested resource. It will generate
# tweets/1/like instead of like/1.
# Let's take a look. In your terminal type rake routes. Notice the difference between relationships routes and the like routes.


  resources :relationships

  get 'profiles/:id' => 'profiles#show', as: :profile
  get 'profiles' => 'profiles#index'
  get "feed" => "profiles#feed"
  
  root 'tweets#index'

end
