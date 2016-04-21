class Review < ActiveRecord::Base
	belongs_to :mentee
	has_one :mentor
end