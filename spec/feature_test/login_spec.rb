require './lib/user.rb'
require_relative 'web_helper'

feature "Login to sleeper" do
  scenario 'gives error if user does not exist' do
    login(username: 'joe', password: '1234')

    expect(current_path).to eq '/login'
    expect(page).to have_content 'error.'
  end
end

feature "Login to sleeper" do
  scenario 'Allow user to login and go to the spaces page' do
    User.create(name: 'joe123', username: 'joe', password: '1234', email: 'o@g.com')
    login(username: 'joe', password: '1234')
    
    expect(current_path).to eq "/spaces"
  end
end
