feature 'can approve a booking' do
  scenario 'I would like to approve a booking' do
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

      booking = Booking.create(
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

      page.find("##{booking.id} .approve").click

      expect(page.find("##{booking.id}")).to have_content('Approved')
  end
end
