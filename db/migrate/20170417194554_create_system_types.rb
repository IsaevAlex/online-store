class CreateSystemTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :system_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
