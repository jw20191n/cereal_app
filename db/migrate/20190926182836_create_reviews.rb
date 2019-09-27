class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.integer :user_id
      t.integer :cereal_id

      t.timestamps
    end
  end
end
