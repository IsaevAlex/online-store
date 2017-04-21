class RemoveColumnsFromBalances < ActiveRecord::Migration[5.0]
  def change
    remove_column :balances, :amount, :decimal
    remove_column :balances, :balance, :decimal
  end
end
