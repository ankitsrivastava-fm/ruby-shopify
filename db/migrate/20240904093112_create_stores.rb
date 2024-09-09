class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :currency
      t.string :timezone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
