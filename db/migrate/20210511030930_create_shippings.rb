class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :post_code
      t.integer :prefecture_id
      t.string :city
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
