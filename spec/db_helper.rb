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

def create_user_in_db(username)
  User.create(
    name: "Sam",
    username: username,
    password: "12345",
    email: "samj@h.com" << DateTime.now.to_s
  )
end
