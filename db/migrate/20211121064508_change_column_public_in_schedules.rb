class ChangeColumnPublicInSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :public, :boolean, default: false
  end
end
