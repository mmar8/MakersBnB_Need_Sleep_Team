require "active_record"
require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt


  def password_input
    p @password ||= Password.new(password_input)
  end
  def password_input=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

  def self.authenticated_user(username:, password_input:)
    p user = find_by(username: username)
    return nil unless user
    if user.password == password_input
      return user
    end
  end

end
