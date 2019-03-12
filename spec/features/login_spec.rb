require './lib/user.rb'

feature "Login to sleeper" do
  scenario 'gives error if user does not exist' do
    visit '/login'
    fill_in 'username', with: 'joe'
    fill_in 'password', with: '1234'
    click_button 'log_in'
    # expect(page).to have_content('Welcome joe')
    expect(current_path).to eq '/login'
    expect(page).to have_content 'error.'
  end
end

feature "Login to sleeper" do
  scenario 'Allow user to login and see the welcome page' do
     User.create(name: 'joe123', username: 'joe', password: '1234', email: 'o@g.com')
    visit '/login'
    fill_in 'username', with: 'joe'
    fill_in 'password', with: '1234'
    click_button 'log_in'
    expect(page).to have_content('Welcome joe123')
    expect(current_path).to eq '/welcome'
  end
end
