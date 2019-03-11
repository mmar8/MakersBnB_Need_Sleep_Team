require './lib/space.rb'

def empty_database
  Space.delete_all
end
