class AddUniquenessToRestaurantManager < ActiveRecord::Migration[5.2]
  def change
    add_index :restaurant_managers, [:restaurant_id, :manager_id], :unique => true
  end
end
