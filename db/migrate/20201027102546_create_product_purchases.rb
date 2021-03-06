class CreateProductPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, unique: true, foreign_key: true

      t.timestamps
    end
  end
end
