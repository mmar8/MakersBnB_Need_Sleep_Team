feature 'shows listings after creation of space' do
  scenario 'As a logged in user I can create a speace & then view the total spaces' do
    visit '/signup'
    fill_in('name', with: 'Bob')
    fill_in('username', with: 'BobBuilder')
    fill_in('password', with: '1234')
    fill_in('email', with: 'Bob@bob.bob')
    click_button('submit')
    click_button('Create Space')
    fill_in 'name', with: 'Makers'
    fill_in 'description', with: 'Living Room'
    fill_in 'price', with: '100'
    click_button('Submit')
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Makers')
  end
end
