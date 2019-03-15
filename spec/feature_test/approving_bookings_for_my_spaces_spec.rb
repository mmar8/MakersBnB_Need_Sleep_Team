require_relative 'web_helper.rb'
require_relative '../db_helper.rb'

feature 'can approve a booking' do
  scenario 'I would like to approve a booking' do
    owner = create_user_then_login('Jane123')
    bookings = create_generic_bookings(owner.id)[:bookings]

    click_button 'Bookings for my space'

    page.find("##{bookings[0].id} .approve").click

    expect(page.find("##{bookings[0].id}")).to have_content('Approved')
  end
end
