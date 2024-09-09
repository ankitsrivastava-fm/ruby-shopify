class AddAddressToStores < ActiveRecord::Migration[7.1]
  def change
    add_column :stores, :address, :string
  end
end
