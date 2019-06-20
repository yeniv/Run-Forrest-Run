class Tweet < ApplicationRecord
  belongs_to :forrest_gump

  def self.link(text)
    Twitter::TwitterText::Autolink.auto_link(text).html_safe
  end

  def self.api
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_consumer_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end

  def self.find_most_recent
    result = Tweet.api.search(
      '#runforrestrun',
      result_type: 'recent',
      tweet_mode: 'extended'
    ).take(1)

    result.map(&:attrs) # returns hash from objects
  end

  def self.find_all
    result = Tweet.api.search(
      '#runforrestrun',
      result_type: 'recent',
      tweet_mode: 'extended'
    )

    result.map(&:attrs)
  end

  def self.find_since_last
    last_tweet_added = Tweet.all.min { |a, b| b.date <=> a.date }

    result = Tweet.api.search(
      '#runforrestrun',
      result_type: 'recent',
      since_id: last_tweet_added.tweet_id,
      tweet_mode: 'extended'
    )

    result.map(&:attrs)
  end

  def self.add(params)
    if params.empty?
      p 'No new tweets found'
      return
    end

    forrest = ForrestGump.last

    params.reverse_each do |tweet|
      if tweet[:entities][:media].nil?
        photo_url = ''
      else
        photo_url = tweet[:entities][:media].first[:media_url_https]
      end

      if tweet[:retweeted_status].nil?
        message = tweet[:full_text]
      else
        message = tweet[:retweeted_status][:full_text]
      end

      new_tweet = Tweet.new(
        forrest_gump: forrest,
        name: tweet[:user][:name],
        screen_name: tweet[:user][:screen_name],
        message: message,
        avatar: tweet[:user][:profile_image_url_https].sub('_normal', ''),
        date: tweet[:created_at],
        tweet_id: tweet[:id],
        photo: photo_url,
        mile: Tweet.count + 1
      )

      if new_tweet.save!
        p "adding new tweet from #{new_tweet.name} (ID: #{new_tweet.id})"

        forrest.distance += 1
        forrest.save!
        ActionCable.server.broadcast 'web_notifications_channel',
                                     distance: forrest.distance,
                                     distance_remaining: (forrest.route_distance - forrest.distance),
                                     name: tweet[:user][:name],
                                     screen_name: tweet[:user][:screen_name],
                                     message: Tweet.link(message),
                                     avatar: tweet[:user][:profile_image_url_https].sub('_normal', ''),
                                     date: tweet[:created_at],
                                     tweet_id: tweet[:id],
                                     photo: photo_url,
                                     mile: Tweet.count,
                                     quote: forrest.quotes.sample
      end
    end
  end
end
