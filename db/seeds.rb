# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying previous database"
Message.destroy_all
Chatroom.destroy_all
Subject.destroy_all
Category.destroy_all
# User.destroy_all

# puts "Seeding database..."

puts "Creating categories..."

categories = [
              {name: "Science", url: "https://images.pexels.com/photos/8539752/pexels-photo-8539752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "Art", url: "https://images.pexels.com/photos/1053687/pexels-photo-1053687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "History", url: "https://images.pexels.com/photos/2402926/pexels-photo-2402926.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "Geography", url: "https://images.pexels.com/photos/893126/pexels-photo-893126.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"},
              {name: "Literature", url: "https://images.pexels.com/photos/1560093/pexels-photo-1560093.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "Music", url: "https://images.unsplash.com/photo-1507838153414-b4b713384a76?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"},
              {name: "Sport", url: "https://images.pexels.com/photos/3621104/pexels-photo-3621104.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "Culture", url: "https://images.pexels.com/photos/1313814/pexels-photo-1313814.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"},
              {name: "Economics", url: "https://images.pexels.com/photos/5715853/pexels-photo-5715853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"}
            ]
# creating a category for each element of the array
categories.each do |category|
  cat = Category.new(name: category[:name])
  file = URI.open(category[:url])
  cat.photo.attach(io: file, filename: category[:name], content_type: 'image/jpg')
  cat.save!
  puts "Created #{cat.name}"
end

puts "Created #{Category.count} categories"

# puts "Creating users..."
# creating an array of users

# puts "Creating 1 teacher"
# teacher = User.create!(email: "teacher@test.com", password: "password", first_name: "Teacher", last_name: "Test", teacher: true)


# puts "Creating 2 students"
# student1 = User.create!(email: "student1@test.com", password: "password", first_name: "Student1", last_name: "Test", teacher: false)
# student2 = User.create!(email: "student2@test.com", password: "password", first_name: "Student2", last_name: "Test", teacher: false)

puts "Creating subjects"
subject1 = Subject.new(name: "Math", description: "Math is fun")
subject2 = Subject.new(name: "Chemistry", description: "Chemistry is fun")
subject3 = Subject.new(name: "Art & Design", description: "Art is fun")
subject4 = Subject.new(name: "Physical Education", description: "Physical Education is fun")
subject5 = Subject.new(name: "Economics", description: "Economics is fun")
subject6 = Subject.new(name: "Society & Culture", description: "Society & Culture is fun")
subject7 = Subject.new(name: "French Literature", description: "French is fun")
subject8 = Subject.new(name: "Roman History", description: "History is fun")
subject9 = Subject.new(name: "World Geography", description: "Geography is fun")

puts "Adding Categories to subjects"
subject1.category = Category.find_by(name: "Science")
subject2.category = Category.find_by(name: "Science")
subject3.category = Category.find_by(name: "Art")
subject4.category = Category.find_by(name: "Sport")
subject5.category = Category.find_by(name: "Economics")
subject6.category = Category.find_by(name: "Society & Culture")
subject7.category = Category.find_by(name: "Literature")
subject8.category = Category.find_by(name: "History")
subject9.category = Category.find_by(name: "Geography")

puts "Saving subjects"
subject1.save
subject2.save
subject3.save
subject4.save
subject5.save
subject6.save
subject7.save
subject8.save
subject9.save

puts "Database seed completed"
