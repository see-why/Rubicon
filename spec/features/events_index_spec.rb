describe 'events index' do
  it 'sorts by event start time and title combined' do
    event_a = Event.create(start_time: Time.now + 1.day, end_time: Time.now + 1.day, title: 'A')
    event_b = Event.create(start_time: Time.now + 1.day, end_time: Time.now + 1.day, title: 'B')
    event_c = Event.create(start_time: Time.now + 2.days, end_time: Time.now + 2.days, title: 'A')

    visit '/'

    expect(event_title(1)).to eq('A')
    expect(event_title(2)).to eq('B')
    expect(event_title(3)).to eq('A')
  end

  def event_title(index)
    page.all("tbody tr:nth-of-type(#{index}) td:first-child").first.text
  end
end
