class Schedule < ApplicationRecord
  belongs_to :calendar
  has_many :users, through: :calendar
  validates :content, :date, presence: true
  validates :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, 'can\'t be in the past') if date.present? && date < Date.today
  end
end
