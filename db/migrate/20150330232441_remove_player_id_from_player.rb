class RemovePlayerIdFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :player_id, :integer
  end
end
