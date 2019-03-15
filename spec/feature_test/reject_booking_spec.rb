require_relative 'web_helper.rb'
require_relative '../db_helper.rb'

feature 'can reject a booking' do
  scenario 'I would like to reject a booking' do
    owner = create_user_then_login('Jane123')
    bookings = create_generic_bookings(owner.id)

    click_button 'bookings for my space'

    page.find("##{bookings[0].id} .reject").click

    expect(page.find("##{bookings[0].id}")).to have_content('Rejected')
  end
end
