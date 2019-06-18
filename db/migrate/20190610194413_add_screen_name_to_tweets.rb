class AddScreenNameToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :screen_name, :string
  end
end
