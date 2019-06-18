require 'sidekiq-scheduler'

class TestJob
  include Sidekiq::Worker

  def perform
    puts 'This is a test!'
  end
end
