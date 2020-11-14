class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :first_name_kana, null:false
      t.string :last_name_kana, null:false
      t.string :zip_code, null:false
      t.string :prefecture, null:false
      t.string :city, null:false
      t.string :town, null:false
      t.string :number, null:false
      t.string :building
      t.string :telephone
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
