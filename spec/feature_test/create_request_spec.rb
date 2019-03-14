require_relative 'web_helper.rb'

feature 'able to request new booking' do
  scenario 'creates new pending booking' do
    owner = User.create(
      name: "Sam",
      username: "Sam",
      password: "12345",
      email: "samj@h.com"
    )

    space = Space.create(
      name: "London house",
      description: "beautiful mansion",
      owner_id: owner.id,
      price: "100",
    )

    guest = create_user_then_login

    fill_in "request_description", with: "I want to rent your house."
    click_button "Send"
    expect(Booking.all[0].request_text).to eq "I want to rent your house."
    user_id = Capybara.current_session.driver.request.session[:userid]
    expect(Booking.all[0].guest_id).to eq user_id
    expect(page).to have_content "Your request is pending"
  end
end
