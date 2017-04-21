class AddScreenIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :screen_id, :integer
  end
end
