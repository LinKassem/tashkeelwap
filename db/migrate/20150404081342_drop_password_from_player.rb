class DropPasswordFromPlayer < ActiveRecord::Migration
  def change
  	remove_column :players, :password
  end
end
