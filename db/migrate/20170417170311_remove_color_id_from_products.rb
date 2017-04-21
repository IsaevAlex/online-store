class RemoveColorIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :color_id, :integer
  end
end
