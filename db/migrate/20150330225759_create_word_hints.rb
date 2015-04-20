class CreateWordHints < ActiveRecord::Migration
  def change
    create_table :word_hints do |t|
      t.string :first_hint
      t.string :second_hint
      t.string :third_hint

      t.timestamps null: false
    end
  end
end
