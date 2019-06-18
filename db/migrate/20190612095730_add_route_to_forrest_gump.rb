class AddRouteToForrestGump < ActiveRecord::Migration[5.2]
  def change
    add_column :forrest_gumps, :route, :string
  end
end
