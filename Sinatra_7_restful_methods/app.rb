require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?


##Seven Restful Methods
# Method 1
get "/teams" do
  "Get all the teams"
  #This method will get all the teams that are avaiable from the list
end

# Method 2
get "/teams/new" do
  "Get a new html form for new team"
  #This method will allow to add a new team to the list using the HTML form
end

# Method 3
post "/teams" do
  "Creates a new team"
  #This method will allow to create a new team and post without need to a new html form
end

# Method 4
get "/teams/:id" do
  "Gets a specific team with an ID"
  # This method allows to access a specific team usind the id
end

# Method 5
get "/teams/:id/edit" do
  "Gets a specific team to edit"
  #This method will allow to get a specific team using id and edit
end

# Method 6
put "/teams/:id" do
  "Updates a specific team"
  #This method will allow to make updates to a specfic team using id
end

# Method 7
delete "/teams/:id" do
  "delete a specfic team"
  #This method will allow to delete a specific team using id
end
