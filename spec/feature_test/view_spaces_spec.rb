require './lib/space.rb'

feature 'able to view all spaces' do 
  scenario 'view all spaces' do
    spaces = [
      { name: 'London beauty', description: 'big flat', price: 100 }, 
      { name: 'Trump Tower', description: 'luxury penthouse', price: 1000 }
    ]

    spaces.each do |space|
      Space.create(space)
    end

    visit ('/spaces')

    expect(page.all('.space').count).to eq(spaces.count)
  end
end