class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :forrest_gump, foreign_key: true
      t.string :user
      t.string :message
      t.string :avatar
      t.date :date

      t.timestamps
    end
  end
end
