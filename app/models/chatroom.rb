class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
end
