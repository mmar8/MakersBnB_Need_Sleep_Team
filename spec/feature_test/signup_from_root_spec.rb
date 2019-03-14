require_relative 'web_helper.rb'

feature 'Sign up to Sleeper from root' do
  scenario 'User signs up to Sleeper' do
    visit '/'
    click_button 'sign_up'

    expect(current_path).to eq "/signup"

  end
end
