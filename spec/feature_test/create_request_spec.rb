feature 'able to request new booking' do
  scenario 'creates new pending booking' do
    visit('/space')
    fill_in('request description', with: 'book 4 days in January')
    click_button 'Send'

    expect(page).to have_content('Request has been sent to the owner')
  end
end