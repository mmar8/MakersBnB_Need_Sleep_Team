require "sinatra/base"
require "pg"
require './lib/user'
require './lib/space.rb'
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

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:username]=params[:username]
    redirect '/welcome'
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

  run! if app_file == $0
end
