class DropProductColorsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :product_colors
  end
end
