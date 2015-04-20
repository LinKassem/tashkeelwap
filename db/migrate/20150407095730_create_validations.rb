class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.string :user_digitization
      t.string :word_image_link
      t.integer :word_id
      t.integer :certinity_rate
      t.boolean :known

      t.timestamps null: false
    end
  end
end
