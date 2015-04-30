class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :player_id
      t.integer :mg_highest_time_record
      t.integer :mg_no_times_played

      t.timestamps null: false
    end
  end
end
