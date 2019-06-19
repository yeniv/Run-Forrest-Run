class AddStartingPositionToForrestGumps < ActiveRecord::Migration[5.2]
  def change
    add_column :forrest_gumps, :starting_position, :string
  end
end
