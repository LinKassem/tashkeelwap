class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :word_id
      t.integer :word_image_url
      t.string :ocr_digitization

      t.timestamps null: false
    end
  end
end
