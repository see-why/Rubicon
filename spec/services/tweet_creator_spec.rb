# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetCreator, type: :service do
  it 'returns nil unless message is set' do
    tweet_creator = TweetCreator.new("")
    expect(tweet_creator.call).to eql (:missing_payload)
  end

  it 'sets message as expected' do
    tweet_creator = TweetCreator.new("Hi guys!.")
    expect(tweet_creator.message).to eql ("Hi guys!.")
  end
end
