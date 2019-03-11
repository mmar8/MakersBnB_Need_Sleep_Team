require "sinatra/base"
require "pg"

class SleeperManager<Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:name] = params[:name]
    redirect '/welcome'
  end

  get '/welcome' do
    @name = session[:name]
    erb :welcome
  end
    run! if app_file == $0
end
