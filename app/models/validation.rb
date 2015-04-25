class Validation < ActiveRecord::Base
	belongs_to :word, :class_name => 'Word', :foreign_key => 'word_id'
end
