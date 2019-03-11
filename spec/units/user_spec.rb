require 'user'
describe User do
  it 'gets created with a name, username, password and email id' do
    user = User.create(name: "Bob", username: "bobbuilder", password: "1234", email: "bob@bob.com")
    expect(user.name).to eq "Bob"
    expect(user.username).to eq "bobbuilder"
    expect(user.password).to eq "1234"
    expect(user.email).to eq "bob@bob.com"
  end
end
