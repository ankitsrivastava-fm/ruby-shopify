class AddTenantIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :tenant, null: false, foreign_key: true
  end
end
