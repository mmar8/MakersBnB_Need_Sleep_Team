require "user"

describe User do
  it " We are able to create users" do
    user1 = User.create(name: 'bob', username: "hey", email: "a@g.com", password: "1234")
    user2 = User.create(name: 'boby', username: "heyy", email: "a@gn.com", password: "12345")
    expect(User.all().length).to eq 2
    expect(User.all()[0].name).to eq "bob"
    expect(User.find_by(name: "bob").email).to eq "a@g.com"
  end
end
