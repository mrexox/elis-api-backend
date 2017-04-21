class Tag < ApplicationRecord
	# Relations
	has_and_belongs_to_many :posts
	
	# Validations
	validates :tag_name, :uniqueness => true
end
