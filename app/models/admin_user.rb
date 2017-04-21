class AdminUser < ApplicationRecord
	# Validations
	validates :login, :uniqueness => true
end
