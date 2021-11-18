# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying previous database"
Subject.destroy_all
Category.destroy_all
# User.destroy_all

# puts "Seeding database..."

puts "Creating categories..."

categories = ["Science", "Art", "History", "Geography", "Literature", "Music", "Sport", "Culture", "Economics"]
# creating a category for each element of the array
categories.each do |category|
  Category.create(name: category)
end

# puts "Creating users..."
# creating an array of users

# puts "Creating 1 teacher"
# teacher = User.create!(email: "teacher@test.com", password: "password", first_name: "Teacher", last_name: "Test", teacher: true)


# puts "Creating 2 students"
# student1 = User.create!(email: "student1@test.com", password: "password", first_name: "Student1", last_name: "Test", teacher: false)
# student2 = User.create!(email: "student2@test.com", password: "password", first_name: "Student2", last_name: "Test", teacher: false)

# puts "Creating 2 subject2"
# subject1 = Subject.new(name: "Math", description: "Math is fun")
# subject2 = Subject.new(name: "Chemistry", description: "Chemistry is fun")
# subject3 = Subject.new(name: "Art & Design", description: "Art is fun")
# subject4 = Subject.new(name: "Physical Education", description: "Physical Education is fun")
# subject5 = Subject.new(name: "Economics", description: "Economics is fun")
# subject6 = Subject.new(name: "Society & Culture", description: "Society & Culture is fun")
# subject7 = Subject.new(name: "French", description: "French is fun")
# subject8 = Subject.new(name: "History", description: "History is fun")
# subject9 = Subject.new(name: "Geography", description: "Geography is fun")

# subject1.category = Category.find_by(name: "Science")
# subject2.category = Category.find_by(name: "Science")
# subject3.category = Category.find_by(name: "Art")
# subject4.category = Category.find_by(name: "Sport")
# subject5.category = Category.find_by(name: "Economics")
# subject6.category = Category.find_by(name: "Society & Culture")
# subject7.category = Category.find_by(name: "Literature")
# subject8.category = Category.find_by(name: "History")
# subject9.category = Category.find_by(name: "Geography")

# subject1.save
# subject2.save
# subject3.save
# subject4.save
# subject5.save
# subject6.save
# subject7.save
# subject8.save
# subject9.save
