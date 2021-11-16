class DropCalendar < ActiveRecord::Migration[6.1]
  def change
    drop_table :calendars
  end
end
