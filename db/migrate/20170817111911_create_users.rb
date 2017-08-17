class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :email, null:false, unique: true
      t.string :hashed_password, null: false

      t.timestamp
    end
  end
end
