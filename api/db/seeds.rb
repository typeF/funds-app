# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "John Smith", email: "john@funds.com", password_digest: BCrypt::Password.create("1"))
Shop.create(title: "Shop1", location: "Vancouver", created_by: user1.id.to_s)
Shop.create(title: "Shop2", location: "Texas", created_by: user1.id.to_s)

user2 = User.create(name: "Jane Doe", email: "jane@funds.com", password_digest: BCrypt::Password.create("1"))
Shop.create(title: "Shop3", location: "New York", created_by: user2.id.to_s)
Shop.create(title: "Shop3", location: "Colorado", created_by: user2.id.to_s)