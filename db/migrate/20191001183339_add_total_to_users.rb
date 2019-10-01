class AddTotalToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total, :integer
  end
end
