require "sinatra/base"
require "pg"
require './lib/space.rb'

class SpaceController < Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
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
    redirect('/space-created')

  end
  
  get '/space-created' do 
    erb :space_created
  end
  
  get '/spaces' do
    @spaces = Space.all
    
    erb :spaces
  end
end
