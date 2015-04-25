class FixSolverIdColumnNameInTableSessions < ActiveRecord::Migration
  def change
  	rename_column :sessions, :solver_id, :player_id
  end
end
