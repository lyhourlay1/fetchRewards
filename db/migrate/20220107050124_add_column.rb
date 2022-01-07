class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :user_id, :string, null:false
  end
end
