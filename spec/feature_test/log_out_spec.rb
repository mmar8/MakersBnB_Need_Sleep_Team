feature 'To be able to sign out' do
  scenario 'I would like to be able to sign out' do
    visit '/'
    click_button('sign-up')
    expect(current_path).to eq '/signup'
    fill_in('name', with: 'Bob')
    fill_in('username', with: 'BobBuilder')
    fill_in('password', with: '1234')
    fill_in('email', with: 'Bob@bob.bob')
    click_button('submit')
    userid = Capybara.current_session.driver.request.session[:userid]
    expect(current_path).to eq "/user/#{userid}"
    click_button('log-out')
    expect(current_path).to eq '/'
    expect(Capybara.current_session.driver.request.session.empty?).to eq true
  end
end
