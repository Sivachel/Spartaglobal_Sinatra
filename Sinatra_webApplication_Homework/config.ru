require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require_relative './controllers/posts_controllers.rb'
require 'Rack'

use Rack::Reloader
use Rack::MethodOverride
# direct the request to the correct controller
run PostsController
