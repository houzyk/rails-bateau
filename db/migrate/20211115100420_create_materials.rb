class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
