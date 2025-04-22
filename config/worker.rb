# frozen_string_literal: true

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class BaseWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when 'simple'
      # Perform a simple task
      puts 'Performing a simple task'
    when 'complex'
      # Perform a complex task
      puts 'Performing a complex task'
    else
      puts 'Unknown complexity level'
    end
  end
end
