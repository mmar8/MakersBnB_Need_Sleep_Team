require_relative "./app.rb"

ActiveRecord::Base.establish_connection(ENV['SLEEPERS_DB_URL'])

run SleeperManager
