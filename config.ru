require_relative "./app.rb"
require_relative "./controllers/space_controller.rb"

ActiveRecord::Base.establish_connection(ENV['SLEEPERS_DB_URL'])

use SpaceController
run SleeperManager
