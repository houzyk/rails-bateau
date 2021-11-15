class Subject < ApplicationRecord
  # ! CONFLICTING ASSOCIATIONS
  has_many :chapters, dependent: :destroy
  belongs_to :category
  has_many :classrooms, dependent: :destroy
  has_many :users , through: :classrooms
end
