class Chapter < ApplicationRecord
  belongs_to :subject
  has_many :materials, dependent: :destroy
end
