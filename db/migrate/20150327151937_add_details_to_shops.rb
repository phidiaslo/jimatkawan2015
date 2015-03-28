class AddDetailsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :title, :string
    add_column :shops, :announcement, :text
    add_column :shops, :welcome_message, :text
    add_column :shops, :shipping_policy, :text
    add_column :shops, :refund_policy, :text
  end
end
