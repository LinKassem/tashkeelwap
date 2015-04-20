class CreateDigitizations < ActiveRecord::Migration
  def change
    create_table :digitizations do |t|
      t.string :user_digitization
      t.integer :repetition
      t.integer :user_validation

      t.timestamps null: false
    end
  end
end
