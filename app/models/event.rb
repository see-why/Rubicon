# frozen_string_literal: true

class Event < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :title, presence: true
  validate :valid_start_and_end_time

  def self.upcoming_events
    where('start_time > ?', Time.now).order(:start_time, :title)
  end

  private

  def valid_start_and_end_time
    return unless start_time && end_time

    errors.add(:start_time, 'start time must be less than end time') unless start_time < end_time
  end
end
