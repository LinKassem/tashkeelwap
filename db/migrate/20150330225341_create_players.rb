class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :email
      t.string :name
      t.string :password
      t.integer :score

      t.timestamps null: false
    end
  end
end
