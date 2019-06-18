class ChangeUserToNameInTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :user, :name
  end
end
