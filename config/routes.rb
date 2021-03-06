Rottenpotatoes::Application.routes.draw do
  # root to: 'movies#index'
  root :to => redirect('/movies')
  resources :movies
  # map '/' to be a redirect to '/movies'
  get 'movies/search_by_director/:id', to: 'movies#similar_movies', as: 'search_director'
end
