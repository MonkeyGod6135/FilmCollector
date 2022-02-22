# each route consists of 3 parts: 1. HTTP Method, 2. Url to webpage
#when view is requested 3. name of ruby class and method envkoed wehn url is requested
Rails.application.routes.draw do
  # When a get request is made fir the actors URL,
  # Rails envokes the index method in the actors Ruby controller class.
  # Rails automaaticly maps the index method to the web page view named
  # index.html.erb and servers the web page to the brower where its rendered.
  get "actors" => "actors#index"

  get "actors/new" => "actors#new"
# When a post request is made for the actors Url
# Rails envokes the create methd in the actors Ruby controller class
  post "actors" => "actors#create"
  get "movies" => "movies#index"
  get "movies/new" => "movies#new"
  post "movies" => "movies#create"
  get "actors/:id" => "actors#show"
  get "movies/:id" => "movies#show"
  get "actors/:id/edit" => "actors#edit"
  post "actors/:id" => "actors#update"
  get "actors/:id/delete" => "actors#delete"
  delete "actors/:id" => "actors#destroy"
  get "movies/:id/edit" => "movies#edit"
  post "movies/:id" => "movies#update"
  get "movies/:id/delete" => "movies#delete"
  delete "movies/:id" => "movies#destroy"
end