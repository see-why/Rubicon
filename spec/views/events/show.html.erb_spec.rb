# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              title: 'Title',
                              start_time: Time.now,
                              end_time: Time.now + 1.hour
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
  end
end
