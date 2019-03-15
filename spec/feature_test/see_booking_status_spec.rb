feature "We can see the status of the bookings we have made" do
  it "shows the status of the bookings we have made" do
    owner = create_user_in_db('Jane')
    space = Space.create(
      name: "London house",
      description: "beautiful mansion",
      owner_id: owner.id,
      price: "100",
    )
    guest = create_user_then_login('Sam')
    fill_in "request_description", with: "I want to rent your house."
    click_button "Send"
    click_button "Back to spaces"
    click_button "MyBookings"
    expect(page).to have_content("I want to rent your house.")
    expect(page).to have_content("pending")
    visit "/spaces"
    click_button "log-out"
    guest_2 = create_user_then_login('soroush')
    fill_in "request_description", with: "I want your house"
    click_button "Send"
    click_button "Back to spaces"
    click_button "MyBookings"
    expect(page).to have_content("I want your house")
    expect(page).not_to have_content("I want to rent your house.")
  end
end
