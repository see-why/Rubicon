require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :start_time => Time.now,
        :end_time => Time.now + 1.hour
      ),
      Event.create!(
        :title => "Title",
        :start_time => Time.now,
        :end_time => Time.now + 1.hour
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
