require './lib/space.rb'
require "./lib/user.rb"

def empty_booking_database
  Booking.delete_all
end

def empty_space_database
  Space.delete_all
end

def empty_user_database
  User.delete_all()
end
