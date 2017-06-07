class Post < ApplicationRecord
  include HasImage
  # Should have one image as cover
  
	# Relations
	has_many :likes
	has_and_belongs_to_many :tags

	# Validations
	validates :permalink, :uniqueness => true

	# Scopes
  scope :sorted, lambda { order('created_at DESC') }

end
