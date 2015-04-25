class Word < ActiveRecord::Base
	has_many :sessions
	has_many :validations
end
