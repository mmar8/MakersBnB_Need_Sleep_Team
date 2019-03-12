require "user.rb"
describe User do
  it"We are able to make a user" do
    user = User.create(name: "soroush", email: "j@as.com")
    user = User.create(name: "soroush", email: "j@a.com")
    ar = []
    User.all.each do |user|
      if user.name == "soroush"
        ar.push(user)
      end
    end
    expect(ar.length()).to eq 2
  end
end
