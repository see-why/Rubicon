class ChangeEventsDateToEndTime < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :end_time, :timestamp
  end

  def down
    drop_column :events, :end_time, :timestamp
  end
end
