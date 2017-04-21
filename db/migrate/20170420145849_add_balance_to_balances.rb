class AddBalanceToBalances < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :balance, :decimal
  end
end
