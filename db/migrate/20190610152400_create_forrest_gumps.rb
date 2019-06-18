class CreateForrestGumps < ActiveRecord::Migration[5.2]
  def change
    create_table :forrest_gumps do |t|
      t.string :name
      t.string :distance

      t.timestamps
    end
  end
end
