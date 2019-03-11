class User
  attr_reader :name, :username, :password, :email
  def initialize(name:, username:, password:, email:)
    @name = name
    @username = username
    @password = password
    @email = email

  end
  def self.create(name:, username:, password:, email:)
    User.new(name: name, username: username, password: password, email: email)
  end
end
