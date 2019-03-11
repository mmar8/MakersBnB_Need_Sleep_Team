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
  end

  run! if app_file == $0
end
