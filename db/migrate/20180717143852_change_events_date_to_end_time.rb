class ChangeEventsDateToEndTime < ActiveRecord::Migration[5.2]
  def up
    rename_column :events, :date, :end_time
    change_column :events, :end_time, :timestamp
  end

  def down
    rename_column :events, :end_time, :date
    change_column :events, :date, :date
  end
end
