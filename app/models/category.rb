class Category < ApplicationRecord
  has_many :subjects, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
