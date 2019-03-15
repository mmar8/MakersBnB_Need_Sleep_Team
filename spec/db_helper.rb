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

def create_space_in_db(owner_id)
  Space.create(
    name: 'Room',
    owner_id: owner_id,
    description: 'A room',
    price: 100
  )
end

def create_generic_bookings(owner_id)
  guest = create_user_in_db("Sam")

  space = create_space_in_db(owner_id)

  bookings = []
  2.times do
    bookings.push(Booking.create(
      space_id: space.id,
      guest_id: guest.id,
      request_text: 'Book room for 4 nights',
      status: 'pending'
    ))
  end

  bookings_with_guest = { bookings: bookings, guest: guest }
end
