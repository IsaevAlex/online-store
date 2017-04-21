class AddGarantAndOnSaleToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :garant, :boolean
    add_column :searches, :on_sale, :boolean
  end
end
