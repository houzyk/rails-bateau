class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :unique_name
      t.string :room_sid
      t.timestamps
    end
  end
end
