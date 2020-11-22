class AddGeomToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :geom, :geometry
  end
end
