class Subject < ApplicationRecord
  # ! CONFLICTING ASSOCIATIONS
  has_many :chapters, dependent: :destroy
  belongs_to :category
  has_many :classrooms, dependent: :destroy
  has_many :users, through: :classrooms

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :description],
    associated_against: {
      category: [:name],
      chapters: [:title]
    },
    using: {
      tsearch: { prefix: true }
    }
end
