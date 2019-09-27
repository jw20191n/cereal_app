class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :cereal_id
      t.integer :amount

      t.timestamps
    end
  end
end
