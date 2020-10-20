class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :name, null:false
      t.text :detail, null:false
      t.integer :category_id
      t.integer :brand_id
      t.integer :status_id, null:false
      t.integer :delivery_charge, null:false
      t.integer :prefecture_id, null:false
      t.integer :delivery_date, null:false
      t.integer :price, null:false
      t.integer :user_id
      t.timestamps
    end
  end
end
