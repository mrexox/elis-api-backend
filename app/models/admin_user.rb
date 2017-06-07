class AdminUser < ApplicationRecord
	has_secure_password
	mount_uploader :avatar, AvatarUploader
	# Validations
	validates :login, :uniqueness => true
end
