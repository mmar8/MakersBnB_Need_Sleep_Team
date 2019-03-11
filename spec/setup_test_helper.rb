require 'pg'
def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'sleepers_test')

# Clear the users table
connection.exec("TRUNCATE users;")
end
