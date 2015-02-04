class Kitten < ActiveRecord::Base
	validates :name,     presence: true
	
	validates :age,
	          :cuteness,
	          :softness, presence: true,
	                     numericality: true


end
