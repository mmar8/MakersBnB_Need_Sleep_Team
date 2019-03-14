require './lib/space.rb'
require './lib/booking.rb'
require './lib/user.rb'

def empty_database
  Booking.delete_all
  Space.delete_all
  User.delete_all
end

def empty_user_database
  User.delete_all()
end
