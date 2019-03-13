require "sinatra/base"
require './lib/space.rb'

class SpaceController < Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end

  before do 
    path = request.path_info
    if (path != "/login"  && path != '/signup') && !session[:userid]
      redirect("/login")
    end
  end

  get '/space/creation' do
    erb :create_space
  end

  post '/space' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      owner_id: session[:userid]
    )

    redirect('/spaces')
  end

  get '/space-created' do
    erb :space_created
  end

  get '/spaces' do
    @spaces = Space.all

    erb :spaces
  end
end
