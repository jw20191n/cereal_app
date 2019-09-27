class AddImgUrlToCereals < ActiveRecord::Migration[6.0]
  def change
    add_column :cereals, :img_url, :string
  end
end
