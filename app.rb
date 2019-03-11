require "sinatra/base"
require "pg"
require './lib/user'

class SleeperManager<Sinatra::Base
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
    run! if app_file == $0
end
