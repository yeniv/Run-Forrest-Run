class ChangeDistanceInForrestGumps < ActiveRecord::Migration[5.2]
  def change
    change_column :forrest_gumps, :distance, :integer, using: 'distance::integer'
  end
end
