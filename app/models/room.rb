class Room < ApplicationRecord
  before_create :add_uniqe_name

  def add_uniqe_name
    unless self.unique_name.present?
      self.unique_name = (0...15).map { ('a'..'z').to_a[rand(26)] }.join
    end
  end
end
