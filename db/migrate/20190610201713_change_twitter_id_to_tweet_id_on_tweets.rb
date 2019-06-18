class ChangeTwitterIdToTweetIdOnTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :twitter_id, :tweet_id
  end
end
