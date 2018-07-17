require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'fills in the start time from the end time if it is blank' do
    expect(Event.new(end_time: Time.now).start_time).to eq(Time.now)
  end
end
