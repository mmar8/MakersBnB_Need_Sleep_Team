def create_space(name, description, price)
  visit ('/space/creation')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price', with: price)

  click_button 'Submit'
end