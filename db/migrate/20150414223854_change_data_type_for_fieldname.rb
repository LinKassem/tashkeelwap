class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :words do |t|
      t.change :word_image_url, :string
    end
  end
  def self.down
    change_table :words do |t|
      t.change :word_image_url, :integer
    end
  end
end
