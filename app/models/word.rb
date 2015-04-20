class Word < ActiveRecord::Base
	has_many :digitizations
	has_one :word_hint
end
