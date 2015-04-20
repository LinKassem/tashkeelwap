class Round < ActiveRecord::Base
	belongs_to :hinter, :class_name => 'Player', :foreign_key => 'hinter_id'
	belongs_to :solver, :class_name => 'Player', :foreign_key => 'solver_id'
	belongs_to :word, :class_name => 'Word', :foreign_key => 'word_id'
end
