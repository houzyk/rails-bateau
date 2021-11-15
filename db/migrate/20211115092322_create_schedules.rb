class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.text :content
      t.boolean :public
      t.date :date

      t.timestamps
    end
  end
end
