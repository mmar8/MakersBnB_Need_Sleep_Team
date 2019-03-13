require "sinatra/base"

require "./controllers/space_controller.rb"
require "./controllers/user_controller.rb"

class SleeperManager<Sinatra::Base
  use SpaceController
  use UserController

  enable :sessions

  configure do
    set :views, 'views/'
    set :public_folder, File.expand_path('../public', __FILE__)
  end

  run! if app_file == $0
end
