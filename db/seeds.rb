# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "faker"

puts "Destroying previous database"
Message.destroy_all
Chatroom.destroy_all
Subject.destroy_all
Category.destroy_all
User.destroy_all

puts "Database clean"

puts "Seeding database..."

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


puts "Creating 100 students"
100.times do
  student = User.new(email: Faker::Internet.unique.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, teacher: false)
  file = URI.open("https://kitt.lewagon.com/placeholder/users/random")
  student.photo.attach(io: file, filename: "student#{student[:first_name]}#{student[:last_name]}", content_type: 'image/jpg')
  student.save
  puts "Created student number #{User.count}"
end
  students = User.count

puts "Creating 20 teachers"
20.times do
  teacher = User.new(email: Faker::Internet.unique.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, teacher: true)
  file = URI.open("https://kitt.lewagon.com/placeholder/users/random")
  teacher.photo.attach(io: file, filename: "teacher#{teacher[:first_name]}#{teacher[:last_name]}", content_type: 'image/jpg')
  teacher.save
  teachers = User.count - students
  puts "Created teacher number #{teachers}"
end

puts "Creating 4 admins"
admin1 = User.new(email: "adminh@test.com", password: "password", first_name:"Houzair", last_name:"Koussa", teacher: true, admin: true)
file1 = URI.open('https://kitt.lewagon.com/placeholder/users/houzyk')
admin1.photo.attach(io: file1, filename: "admin1" , content_type: 'image/jpg')
admin1.save

admin2 = User.new(email: "adminy@test.com", password: "password", first_name:"Yogaisan", last_name:"Ramasawmy", teacher: true, admin: true)
file2 = URI.open('https://kitt.lewagon.com/placeholder/users/yogaisan')
admin2.photo.attach(io: file2, filename: "admin2" , content_type: 'image/jpg')
admin2.save

admin3 = User.new(email: "admind@test.com", password: "password", first_name:"Dhanistha", last_name:"Goordoyal", teacher: true, admin: true)
file3 = URI.open('https://kitt.lewagon.com/placeholder/users/dhanistha')
admin3.photo.attach(io: file3, filename: "admin3" , content_type: 'image/jpg')
admin3.save

admin4 = User.new(email: "adminc@test.com", password: "password", first_name:"Christian", last_name:"Bongard", teacher: true, admin: true)
file4 = URI.open('https://kitt.lewagon.com/placeholder/users/cbongard90')
admin4.photo.attach(io: file4, filename: "admin4" , content_type: 'image/jpg')
admin4.save

puts "Created #{User.count} users"




puts "Creating subjects"
subject1 = Subject.new(name: "Mathematics", description: "Mathematics is fun")
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
