class Chatroom < ApplicationRecord
  has_many :participants, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }

  def self.create_private_room(users, room_name)
    single_room = Chatroom.create(name: room_name, isprivate: true)
    users.each do |user|
      Participant.create(user_id: user.id, chatroom_id: single_room.id)
    end
    single_room
  end
end
