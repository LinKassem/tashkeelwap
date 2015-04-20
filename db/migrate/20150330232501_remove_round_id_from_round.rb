class RemoveRoundIdFromRound < ActiveRecord::Migration
  def change
    remove_column :rounds, :round_id, :integer
  end
end
