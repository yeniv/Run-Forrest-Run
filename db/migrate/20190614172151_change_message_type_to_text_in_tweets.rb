class ChangeMessageTypeToTextInTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :message, :text
  end
end
