require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/post.rb'
require_relative './controllers/posts_controllers.rb'
require 'Rack'

use Rack::Reloader
use Rack::MethodOverride
# direct the request to the correct controller
run PostsController
