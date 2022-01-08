class RemoveTimestamp < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :timestamp
    add_column :transactions, :timestamp, :date
  end
end
