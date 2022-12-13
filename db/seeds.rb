# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing Database..."

User.destroy_all

puts "Creating a new database..."

User.new(first_name: "Doreen", last_name: "Lam", email: "test1@test.com", password: "123456").save!
User.new(first_name: "Jack", last_name: "Brown", email: "test2@test.com", password: "123456").save!
User.new(first_name: "John", last_name: "Smith", email: "test3@test.com", password: "123456").save!
User.new(first_name: "Katy", last_name: "You", email: "test4@test.com", password: "123456").save!
User.new(first_name: "Tom", last_name: "Go", email: "test5@test.com", password: "123456").save!
User.new(first_name: "Bob", last_name: "Dylan", email: "test6@test.com", password: "123456").save!

puts "Done! #{User.count} users created!"
