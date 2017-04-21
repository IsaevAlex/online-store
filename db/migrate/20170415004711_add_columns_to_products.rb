class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :memory, :integer
    add_column :products, :ram, :integer
    add_column :products, :battery_charge, :integer
  end
end
