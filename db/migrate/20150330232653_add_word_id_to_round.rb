class AddWordIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :word_id, :integer
  end
end
