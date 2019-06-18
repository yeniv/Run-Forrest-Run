class AddQuotesToForrestGump < ActiveRecord::Migration[5.2]
  def change
    add_column :forrest_gumps, :quotes, :string
  end
end
