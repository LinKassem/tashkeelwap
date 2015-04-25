class DropRoundsWordHints < ActiveRecord::Migration
  def change
  	drop_table :rounds
  	drop_table :word_hints
  end
end
