class AddIsprivateToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :isprivate, :boolean, default: false
  end
end
