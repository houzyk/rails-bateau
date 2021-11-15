class AddCategoryReferencesToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjects, :category, null: false, foreign_key: true
  end
end
