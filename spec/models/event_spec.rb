require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'validates title' do
    event = Event.new(start_time: Time.now, end_time: Time.now + 1.hour)
    event.valid?
    expect(event.errors[:title]).to include("can't be blank")
  end

  it 'validates start_time' do
    event = Event.new(title: "Flash's wedding", end_time: Time.now + 1.hour)
    event.valid?
    expect(event.errors[:start_time]).to include("can't be blank")
  end

  it 'validates end_time' do
    event = Event.new(title: "Flash's wedding", start_time: Time.now + 1.hour)
    event.valid?
    expect(event.errors[:end_time]).to include("can't be blank")
  end

  it 'validate start_time < end_time' do
    event = Event.new(title: "Flash's wedding", start_time: Time.now + 1.hour, end_time: Time.now)
    event.valid?
    expect(event.errors.full_messages).to include("start time must be less than end time")
  end

  describe '.upcoming_events' do
    it 'returns only upcoming events' do
      Event.create(start_time: Time.now + 1, end_time: Time.now + 2.hour, title: "A")
      Event.create(start_time: Time.now + 1, end_time: Time.now + 2.hour, title: "B")
      Event.create(start_time: Time.now + 1, end_time: Time.now + 2.hour, title: "C")
      Event.create(start_time: Time.now - 1, end_time: Time.now, title: "D")

      upcoming_events = Event.upcoming_events
      expect(upcoming_events.map(&:title)).to match_array(["A", "B", "C"])
    end

    it 'orders events with the same start time correctly' do
      start_date = Time.now
      Event.create(start_time: start_date + 1, end_time: start_date + 2.hour, title: "B")
      Event.create(start_time: start_date + 1, end_time: start_date + 2.hour, title: "A")
      Event.create(start_time: start_date + 1, end_time: start_date + 2.hour, title: "C")
      Event.create(start_time: start_date - 1, end_time: start_date, title: "D")

      upcoming_events = Event.upcoming_events
      expect(upcoming_events[0].title).to eq("A")
      expect(upcoming_events[1].title).to eq("B")
    end
  end
end
