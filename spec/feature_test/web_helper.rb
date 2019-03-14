require './lib/user.rb'
require_relative '../db_helper.rb'

def create_space(name, description, price)
  visit ('/space/creation')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price', with: price)

  click_button 'Submit'
end

def sign_up(
  name:, 
  username:, 
  password:, 
  email:
)
  visit '/signup'

  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('email', with: email)

  click_button('submit')
end

def login(username:, password:)
  visit '/login'

  fill_in 'username', with: username
  fill_in 'password', with: password

  click_button 'log_in'
end

def create_user_then_login(username)
  user = create_user_in_db(username)

  login(username: username, password: user.password)

  user
end