class AddWordIdToDigitization < ActiveRecord::Migration
  def change
    add_column :digitizations, :word_id, :integer
  end
end
