class Schedule < ApplicationRecord
  belongs_to :user
  validates :content, :date, presence: true
  validate :date_cannot_be_in_the_past
  has_rich_text :content

  def date_cannot_be_in_the_past
    errors.add(:date, 'can\'t be in the past') if date.present? && date < Date.today
  end

include PgSearch::Model

  pg_search_scope :search_by_content,
    against: [:content],
    using: {
    tsearch: { prefix: true }
    }
end
