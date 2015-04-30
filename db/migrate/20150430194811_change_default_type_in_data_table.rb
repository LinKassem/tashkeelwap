class ChangeDefaultTypeInDataTable < ActiveRecord::Migration
	def change
		change_column :data, :mg_highest_time_record, :integer, default: -1
	end
end
