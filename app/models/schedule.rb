class Schedule < ApplicationRecord
  belongs_to :calendar
  has_many :users, through: :calendar
end
