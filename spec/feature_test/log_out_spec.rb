require_relative 'web_helper'
feature 'To be able to sign out' do
  scenario 'I would like to be able to sign out' do
    sign_up(
      name: 'Bob',
      username: 'BobBuilder',
      password: '1234',
      email: 'Bob@bob.bob' 
    )

    click_button('log-out')
    expect(current_path).to eq '/login'
    expect(Capybara.current_session.driver.request.session[:userid]).to eq nil
  end
end
