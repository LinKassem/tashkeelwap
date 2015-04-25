class DropDigitization < ActiveRecord::Migration
  def change
  	drop_table :digitizations
  end
end
