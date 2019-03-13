require "active_record"
require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
end
