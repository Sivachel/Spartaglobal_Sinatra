require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
#create out first router
get "/cars" do
  "Get all cars"
end

get "/cars/new" do
  "Get new form"
end

post "/cars" do
  "Adding a new car"
end

get "/cars/:id" do
  "Get a specific"
end

get "/cars/:id" do
  id = params[:id]
  "Get a specific car #{id}"
end

get "/cars/:id/edit" do
  "update a specific car"
end

put "/cars/:id" do
  "update a specific photo"
end

delete "/cars/:id" do
  "delete a specific car"
end
