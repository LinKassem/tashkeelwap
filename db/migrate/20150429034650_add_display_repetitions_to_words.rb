class AddDisplayRepetitionsToWords < ActiveRecord::Migration
  def change
    add_column :words, :display_repetitions, :integer
  end
end
