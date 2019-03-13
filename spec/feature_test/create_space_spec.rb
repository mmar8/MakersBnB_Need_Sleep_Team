require './lib/space.rb'
require_relative 'web_helper.rb'

feature 'able to create space' do
  let(:name) { 'London' }
  let(:description) { 'spacious flat in central London' } 
  let(:price) { 100 }

  before(:each) do
    @user = User.create(name: 'joe123', username: 'joe', password: '1234', email: 'o@g.com')
    visit '/login'
    fill_in 'username', with: 'joe'
    fill_in 'password', with: '1234'
    click_button 'log_in'
    create_space(name, description, price)
    @saved_space = Space.all[0]
  end

  scenario 'inform user space created' do
    expect(page).to have_content('Listing successfully created')
  end

  scenario 'saved space includes name' do
    expect(@saved_space.name).to eq(name)
  end

  scenario 'saved space includes price' do
    expect(@saved_space.price).to eq(price)
  end

  scenario 'saved space includes description' do
    expect(@saved_space.description).to eq(description)
  end

  scenario 'saved space includes owner_id' do 
    expect(@saved_space.owner_id).to eq(@user.id)
  end


end