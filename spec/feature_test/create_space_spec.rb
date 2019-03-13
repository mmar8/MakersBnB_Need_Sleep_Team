require './lib/space.rb'
require_relative 'web_helper.rb'

feature 'able to create space' do
  let(:name) { 'London' }
  let(:description) { 'spacious flat in central London' } 
  let(:price) { 100 }

  before(:each) do
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
end