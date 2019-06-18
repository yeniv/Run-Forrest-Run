class AddMileToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :mile, :integer
  end
end
