class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :content, presence: true
  before_create :confirm_participant
  # has_rich_text :content

  def confirm_participant
    if self.chatroom.isprivate
      is_participant = Participant.where(user_id: self.user.id, chatroom_id: self.chatroom.id).first
      throw :abort unless is_participant
    end
  end
end
