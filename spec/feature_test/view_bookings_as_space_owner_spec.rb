require_relative 'web_helper'
require 'booking'
feature 'As a space owner' do
  scenario 'I will be able to view my approved and pending bookings' do

  owner = create_user_then_login('Jane123')
    guest = User.create(
      name: "Sam",
      username: "Sam",
      password: "12345",
      email: "samj@h.com"
    )

    space = Space.create(
      name: 'Room', 
      owner_id: owner.id, 
      description: 'A room', 
      price: 100
    )
    
    Booking.create(
      space_id: space.id, 
      guest_id: guest.id, 
      request_text: 'Book room for 4 nights',
      status: 'pending'
    )

    Booking.create(
      space_id: space.id, 
      guest_id: guest.id, 
      request_text: 'Book room for 5 nights',
      status: 'pending'
    )

    click_button 'bookings for my space'
    bookings = page.all('.booking')
    expect(bookings.length).to eq 2
  end
end
