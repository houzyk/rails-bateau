class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
