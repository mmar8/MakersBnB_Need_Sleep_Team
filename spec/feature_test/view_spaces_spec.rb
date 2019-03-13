require './lib/space.rb'
require_relative 'web_helper.rb'

feature 'able to view all spaces' do
  scenario 'view all spaces' do
    @user = create_user_then_login
    spaces = [
      { name: 'London beauty', description: 'big flat', price: 100, owner_id: @user.id },
      { name: 'Trump Tower', description: 'luxury penthouse', price: 1000, owner_id: @user.id }
    ]

    spaces.each do |space|
      Space.create(space)
    end
    visit ('/spaces')
    expect(page.all('.space').count).to eq(spaces.count)
  end
end
