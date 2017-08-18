class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type

      t.timestamp
    end
  end
end
