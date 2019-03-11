require "pg"
class User
  attr_reader :name, :username, :password, :email
  def initialize(name:, username:, password:, email:)
    @name = name
    @username = username
    @password = password
    @email = email

  end
  def self.create(name:, username:, password:, email:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect( dbname: 'sleepers_test')
    else
      connection = PG.connect(dbname: 'sleepers')
    end
    result =connection.exec("INSERT INTO users (name,username,password,email) VALUES ('#{name}','#{username}','#{password}','#{email}') RETURNING id,name,username,password,email;")
    User.new(name: result[0]['name'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
  end
end
