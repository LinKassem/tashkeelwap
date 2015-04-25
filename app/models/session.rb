class Session < ActiveRecord::Base
	belongs_to :player, :class_name => 'Player', :foreign_key => 'solver_id'
	belongs_to :word, :class_name => 'Word', :foreign_key => 'word_id'
end
