class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
