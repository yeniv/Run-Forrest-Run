class UpdateTwitterIdTypeInTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :twitter_id, :bigint
  end
end
