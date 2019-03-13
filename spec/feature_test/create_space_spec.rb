feature 'able to create space' do
  scenario 'create a space' do
    visit ('/space/creation')
    fill_in('name', with: 'London')
    fill_in('description', with: 'spacious flat in central London')
    fill_in('price', with: 100)

    click_button 'Submit'

    expect(page).to have_content('London')
  end
end
