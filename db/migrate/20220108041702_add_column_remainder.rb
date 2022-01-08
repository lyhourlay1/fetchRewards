class AddColumnRemainder < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :remainder, :integer
  end
end
