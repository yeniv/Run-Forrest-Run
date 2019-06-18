class ChangeDateColumnTypeInTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :date, :datetime
  end
end
