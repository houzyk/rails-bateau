class Schedule < ApplicationRecord
  belongs_to :calendar
  has_many :users, through: :calendar
  validates :content, :date, presence: true
  # ! validates :date
end
