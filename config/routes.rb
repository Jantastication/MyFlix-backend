Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :movies
      resources :ratings
      get '/myMovies/:user_id', to: 'movies#my_movies'
    end
  end
end
