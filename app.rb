require "sinatra/base"
require "pg"
require './lib/user'
require './lib/space.rb'
class SleeperManager<Sinatra::Base
  enable :sessions
  get '/' do
    session.clear()
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
     session[:userid] = User.create(name: params[:name], username: params[:username], password: params[:password], email: params[:email]).id
    redirect '/welcome'
  end

  get '/welcome' do
     @user = User.find_by(id: session[:userid])
   #  if session[:username] != nil
   #    @user = session[:username]
   # elsif session[:user] != nil
   #    @userr = session[:user]
   #    @user = @userr.name
   # else
   #   @user = 'error'
   # end
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  post '/login' do

    session[:userid] = User.find_by(username: params[:username], password: params[:password]).id
    # session[:username]=params[:username]
    if session[:userid] != nil
    redirect '/welcome'
    else
    erb :error
    end
  end



  get '/space/creation' do
    erb :create_space
  end

  post '/space' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    redirect('/space-created')
  end

  get '/space-created' do
    erb :space_created
  end

  get '/spaces' do
    @spaces = Space.all

    erb :spaces
  end

  get '/log-out' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
