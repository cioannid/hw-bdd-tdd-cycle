Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'movies/search_by_director/:id', to: 'movies#similar_movies', as: 'search_director'
end
