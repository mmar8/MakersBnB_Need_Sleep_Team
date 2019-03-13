require './lib/user.rb'

def create_space(name, description, price)
  visit ('/space/creation')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price', with: price)

  click_button 'Submit'
end

def sign_up(name, username, password, email)
  visit '/'
  click_button('sign-up')

  expect(current_path).to eq '/signup'

  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('email', with: email)

  click_button('submit')
end

def login(username, password)
  visit '/login'

  fill_in 'username', with: username
  fill_in 'password', with: password

  click_button 'log_in'
end

def create_user_then_login()
  username = 'joe'
  password = '1234'
  @user = User.create(
    name: 'joe123', 
    username: username, 
    password: password, 
    email: 'o@g.com'
  )

  login(username, password)

  @user
end