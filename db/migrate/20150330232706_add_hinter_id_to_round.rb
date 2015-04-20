class AddHinterIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :hinter_id, :integer
  end
end
