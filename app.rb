require "sinatra/base"
require "pg"
require './lib/space.rb'

class SleeperManager<Sinatra::Base
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
