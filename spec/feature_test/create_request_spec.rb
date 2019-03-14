require_relative 'web_helper.rb'

feature 'able to request new booking' do
  scenario 'creates new pending booking' do
    space = Space.create(
      name: "London house",
      description: "beautiful mansion",
      price: "100",
    )
    sign_up(
      name: "Maria",
      username: "maria",
      password: "1234",
      email: "a@b.com"
    )
    fill_in "request_description",with: "I want to rent your house."
    click_button "Send"
    expect(Booking.all[0].request_text).to eq "I want to rent your house."
    user_id = Capybara.current_session.driver.request.session[:userid]
    expect(Booking.all[0].guest_id).to eq user_id
    expect(page).to have_content "Your request is pending"
  end
end
