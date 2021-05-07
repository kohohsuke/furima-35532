class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_free_id
      t.integer :prefecture_id
      t.integer :schedule_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
