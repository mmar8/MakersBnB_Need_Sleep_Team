require './lib/space.rb'
require_relative 'web_helper.rb'

feature 'able to create space' do
  scenario 'go to create space page' do
    create_user_then_login('Sam')
    click_button('Create Space')

    expect(current_path).to eq "/space/creation"
  end

  feature 'create a space' do
    let(:name) { 'London' }
    let(:description) { 'spacious flat in central London' } 
    let(:price) { 100 }

    before(:each) do
      @user = create_user_then_login('Sam')
      create_space(name, description, price)
      @saved_space = Space.all[0]
    end

    scenario 'redirect user to spaces page after creation' do
      expect(current_path).to eq('/spaces')
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
end
