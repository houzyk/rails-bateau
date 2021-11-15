class RemoveUserFromSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_reference :subjects, :user, null: false, foreign_key: true
  end
end
