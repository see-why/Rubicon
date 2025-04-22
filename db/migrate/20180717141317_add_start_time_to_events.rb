# frozen_string_literal: true

class AddStartTimeToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :start_time, :timestamp
  end

  def down
    drop_column :events, :start_time, :timestamp
  end
end
