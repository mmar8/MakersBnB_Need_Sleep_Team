require "sinatra/base"

require "./controllers/space_controller.rb"
require "./controllers/user_controller.rb"
require "./controllers/booking_controller.rb"
class SleeperManager<Sinatra::Base
  use SpaceController
  use UserController
  use BookingController

  enable :sessions

  run! if app_file == $0
end
