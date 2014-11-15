HappyHour::Application.routes.draw do
  resources :places do
    resources :specials
  end

  get '/facebook_places' => 'facebook_places#index'

  root :to => 'places#index'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/sign_out' => 'sessions#destroy', :as => 'sign_out'
end
