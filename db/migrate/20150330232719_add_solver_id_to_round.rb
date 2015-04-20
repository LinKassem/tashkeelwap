class AddSolverIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :solver_id, :integer
  end
end
