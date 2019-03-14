require_relative 'web_helper.rb'
require_relative '../db_helper.rb'

feature 'able to request new booking' do
  scenario 'creates new pending booking' do
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
    expect(Booking.all[0].request_text).to eq "I want to rent your house."
    expect(Booking.all[0].space_id).to eq space.id
    expect(Booking.all[0].guest_id).to eq guest.id
    expect(page).to have_content "Your request is pending"
  end
end
