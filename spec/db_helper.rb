require './lib/space.rb'
require './lib/booking.rb'
require './lib/user.rb'

def empty_database
  Booking.delete_all
  Space.delete_all
  User.delete_all
end
