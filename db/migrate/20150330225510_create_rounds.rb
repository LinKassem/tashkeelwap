class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :round_id
      t.integer :hint_requested
      t.integer :hint_sent

      t.timestamps null: false
    end
  end
end
