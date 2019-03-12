require "sinatra/base"
require "pg"
require './lib/user'
require './lib/space.rb'
require "./controllers/space_controller.rb"

class SleeperManager<Sinatra::Base
  use SpaceController

  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end
  
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:user] = User.create(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
    redirect '/welcome'
  end

  get '/welcome' do
     @user = session[:user]
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:username]=params[:username]
    redirect '/welcome'
  end

  run! if app_file == $0
end
