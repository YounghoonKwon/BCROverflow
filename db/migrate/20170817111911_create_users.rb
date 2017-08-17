class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null:false, unique: true
      t.string :hashed_password, null: false

      t.timestamps
    end
  end
end
