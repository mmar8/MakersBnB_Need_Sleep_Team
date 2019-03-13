require "sinatra/base"
require './lib/user.rb'

class UserController < Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(
      name: params[:name], 
      username: params[:username], 
      password: params[:password], 
      email: params[:email]
    )

    session[:userid] = @user.id
    redirect "/spaces"
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect "/spaces"
    else
      erb :error
    end
  end

  get '/log-out' do
    session.clear
    redirect "/login" 
  end 
end
