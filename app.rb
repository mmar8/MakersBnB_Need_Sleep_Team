require "sinatra/base"
require "pg"

class SleeperManager<Sinatra::Base
    run! if app_file == $0
end
