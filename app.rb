require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'lib/cookbook'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  erb :index
end

get '/list' do
  #
end

get '/create' do
  #
end

get '/toggle' do
  #
end

get '/destroy' do
  #
end

get '/search' do
  #
end

# get '/about' do
#   erb :about
# end

# get '/team/:username' do
#   puts params[:username]
#   "The username is #{params[:username]}"
# end
