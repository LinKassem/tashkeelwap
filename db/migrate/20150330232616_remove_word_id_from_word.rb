class RemoveWordIdFromWord < ActiveRecord::Migration
  def change
    remove_column :words, :word_id, :integer
  end
end
