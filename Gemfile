source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rack-cors', :require => 'rack/cors'

# Changing all dashes in request to underscores
# ... so use dasherized names in Ember
gem 'olive_branch'

# Authentication
gem 'jwt'
gem 'simple_command'

gem 'rails', '~> 5.0.2'
gem 'sqlite3'
gem 'puma', '~> 3.0'

# Secure password
gem 'bcrypt', '~> 3.1.7'

# Images uploader
gem 'carrierwave', '~> 1.0'

# Serialization JSON API
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
