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
    redirect "/user/#{session[:userid]}"
  end

  get '/user/:userid' do
     @user = User.find_by(id: session[:userid])
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username], password: params[:password])
    if user != nil
      session[:userid] = user.id
      redirect "/user/#{session[:userid]}"
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
