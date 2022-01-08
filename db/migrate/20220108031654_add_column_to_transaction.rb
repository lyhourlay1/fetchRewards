class AddColumnToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :redeemed, :boolean, null:false
  end
end
