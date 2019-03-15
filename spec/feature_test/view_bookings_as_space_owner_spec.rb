require_relative 'web_helper'
require_relative '../db_helper'
require 'booking'

feature 'As a space owner' do
  scenario 'I will be able to view my approved and pending bookings' do
    owner = create_user_then_login('Jane123')
    create_generic_bookings(owner.id)

    click_button 'Bookings for my space'

    bookings = page.all('.booking')
    expect(bookings.length).to eq 2
  end
end
