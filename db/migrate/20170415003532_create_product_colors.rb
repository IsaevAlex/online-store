class CreateProductColors < ActiveRecord::Migration[5.0]
  def change
    create_table :product_colors do |t|
      t.integer :product_id
      t.integer :сolor_id

      t.timestamps
    end
  end
end
