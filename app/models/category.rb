class Category < ApplicationRecord
  has_many :subjects, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
