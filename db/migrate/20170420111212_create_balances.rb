class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.decimal :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
