require_relative 'web_helper.rb'

feature 'Sign up to Sleeper' do
  scenario 'User signs up to Sleeper' do
    sign_up(
      name: 'Bob', 
      username: 'BobBuilder', 
      password: '1234', 
      email: 'Bob@bob.com'
    )

    expect(current_path).to eq "/spaces"
  end
end
