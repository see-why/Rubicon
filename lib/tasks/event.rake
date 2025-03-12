namespace :event do
  task update_nil_end_time_start_time: :evvironment do
    # guard clause
    Event.where(start_time: nil).find_in_batches do |batch|
      batch.each do |event|
        event.update(start_time: event.date, end_time: event.date)
      end
    end
  end
end
