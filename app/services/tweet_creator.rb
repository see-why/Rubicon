# app/services/tweet_creator.rb
class TweetCreator < ApplicationService
  attr_reader :message

  RETURNS = [
    SUCCESS = :success,
    FAILURE = :failure,
    MISSING_PAYLOAD = :missing_payload
  ]

  def initialize(message)
    @message = message
  end

  def call
    return MISSING_PAYLOAD unless @message.present?

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
      config.access_token        = Rails.application.credentials.dig(:twitter, :access_token)
      config.access_token_secret = Rails.application.credentials.dig(:twitter, :access_secret)
    end

    client.update(@message)
    SUCCESS
  rescue => e
    puts "TweeT failed: #{e.message}"
    FAILURE
  end
end
