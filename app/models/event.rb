class Event < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :valid_start_and_end_time

  def start_time
    super || end_time
  end

  private

  def valid_start_and_end_time
    start_time <= end_time
  end
end
