class AddTimeStamp < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :timestamp, :date, null:false
  end
end
