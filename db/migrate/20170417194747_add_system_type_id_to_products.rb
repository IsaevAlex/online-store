class AddSystemTypeIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :system_type_id, :integer
  end
end
