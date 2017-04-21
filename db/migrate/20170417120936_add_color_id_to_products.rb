class AddColorIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :color_id, :integer
  end
end
