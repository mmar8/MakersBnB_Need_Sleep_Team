require "sinatra/base"
require "pg"
require './lib/space.rb'

class SleeperManager<Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end
  
  run! if app_file == $0
end
