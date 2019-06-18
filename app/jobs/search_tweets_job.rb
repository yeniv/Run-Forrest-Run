require 'sidekiq-scheduler'

class SearchTweetsJob
  include Sidekiq::Worker

  def perform
    p "Searching Twitter for new '#runforrerstrun' tweets"
    Tweet.add(Tweet.find_since_last)
    p 'Search complete'
  end
end
