class Post < ApplicationRecord
	# Relations
	has_many :likes
	has_and_belongs_to_many :tags

	# Validations
	validates :permalink, :uniqueness => true
end
