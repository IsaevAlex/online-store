class DropSystemsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :systems
  end
end
