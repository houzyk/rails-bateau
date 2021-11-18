class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  # ! NEW
  # after_create_commit {broadcast_append_to "rooms"}

  def self.create_private_room(users, room_name)
    single_room = Chatroom.create(name: room_name, isprivate: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id )
    end
    single_room
  end
end
