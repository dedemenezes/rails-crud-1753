class AddAddressToRestaurants < ActiveRecord::Migration[7.2]
  def change
    # rails guides migrations
    add_column :restaurants, :address, :string
  end
end
