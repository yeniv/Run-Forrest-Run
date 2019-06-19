class AddRouteDistanceToForrestGumps < ActiveRecord::Migration[5.2]
  def change
    add_column :forrest_gumps, :route_distance, :integer
  end
end
