# uri = URI.parse(ENV['REDISTOGO_URL'])
# REDIS = Redis.new(:url => uri)

$redis = Redis.new

# url = ENV["REDISCLOUD_URL"]
url = ENV["REDISTOGO_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
