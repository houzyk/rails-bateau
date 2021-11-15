class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.refences :user

      t.timestamps
    end
  end
end
