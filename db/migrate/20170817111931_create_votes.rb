class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type
      t.integer :value
      #alasdjalkdjasl;kdjasjkcaskjdsadjas;djask;lj

      t.timestamp
    end
  end
end
