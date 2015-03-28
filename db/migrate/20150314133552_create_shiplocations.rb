class CreateShiplocations < ActiveRecord::Migration
  def change
    create_table :shiplocations do |t|
      t.string :country
      t.decimal :price, precision: 10, scale: 2
      t.decimal :cost, precision: 10, scale: 2
      t.references :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :shiplocations, :listings
  end
end
