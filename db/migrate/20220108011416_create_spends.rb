class CreateSpends < ActiveRecord::Migration[5.2]
  def change
    create_table :spends do |t|
      t.integer :points, null:false
      t.integer :user_id, null:false 

      t.timestamps
    end
  end
end
