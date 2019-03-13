require "./lib/user.rb"

def setup_test_database
  User.delete_all()
end
