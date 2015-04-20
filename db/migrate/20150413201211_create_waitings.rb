class CreateWaitings < ActiveRecord::Migration
  def change
    create_table :waitings do |t|
      t.integer :waiting_player_id

      t.timestamps null: false
    end
  end
end
