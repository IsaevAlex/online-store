class AddAmountAndBalanceToBalances < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :balance, :integer
    add_column :balances, :amount, :integer
  end
end
