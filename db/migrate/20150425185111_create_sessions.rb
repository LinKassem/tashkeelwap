class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :solver_id
      t.integer :hinter_id
      t.integer :word_id
      t.string :digitization
      t.string :hint_1
      t.string :hint_2
      t.string :hint_3

      t.timestamps null: false
    end
  end
end
