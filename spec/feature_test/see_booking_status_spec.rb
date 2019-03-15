feature "We can see the status of the bookings we have made" do
  scenario "shows the status of the bookings we have made" do
    owner = create_user_in_db('Jane')
    create_generic_bookings(owner.id)

    owner2 = create_user_in_db('Simon')
    guest = create_generic_bookings(owner2.id)[:guest]

    login(username: guest.username, password: guest.password)
    visit "/requested_bookings"

    bookings = page.all(".booking")
    expect(bookings.length).to eq 2
  end
end
