class AddRoundTimeToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :round_time, :integer
  end
end
