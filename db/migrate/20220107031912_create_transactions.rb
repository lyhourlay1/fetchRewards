class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :payer, null:false
      t.integer :points, null:false
      t.timestamps
    end
    add_index(:transactions, :payer)
  end
end
