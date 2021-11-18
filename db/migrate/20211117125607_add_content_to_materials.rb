class AddContentToMaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :content, :text
  end
end
