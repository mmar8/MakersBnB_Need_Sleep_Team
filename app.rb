require "sinatra/base"

require "./controllers/space_controller.rb"
require "./controllers/user_controller.rb"

class SleeperManager<Sinatra::Base
  use SpaceController
  use UserController

  enable :sessions

  run! if app_file == $0
end
