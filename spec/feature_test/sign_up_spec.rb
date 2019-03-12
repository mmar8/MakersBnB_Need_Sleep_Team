require "pg"

feature 'Sign up to Sleeper' do
  scenario 'User signs up to Sleeper' do
    visit '/'
    click_button('sign-up')
    expect(current_path).to eq '/signup'
    fill_in('name', with: 'Bob')
    fill_in('username', with: 'BobBuilder')
    fill_in('password', with: '1234')
    fill_in('email', with: 'Bob@bob.bob')
    click_button('submit')
    expect(page).to have_content('Welcome Bob')
    userid = Capybara.current_session.driver.request.session[:userid]
    expect(current_path).to eq "/user/#{userid}"
  end
end
