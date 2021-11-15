class Subject < ApplicationRecord
  belongs_to :user # for a teacher
  has_many :chapters, dependent: :destroy
  belongs_to :category
  has_many :classrooms, dependent: :destroy
  has_many :users, through: :classrooms # for students
end
