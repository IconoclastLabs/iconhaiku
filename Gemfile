source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'friendly_id'
gem 'paperclip'
gem "activeadmin"
gem "kaminari"
gem "aws-s3"
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "thin", ">= 1.5.0"
gem "haml", ">= 3.1.7"
gem "haml-rails", ">= 0.3.5", :group => :development
gem "hpricot", ">= 0.8.6", :group => :development
gem "ruby_parser", ">= 2.3.1", :group => :development
gem "rspec-rails", ">= 2.11.0", :group => [:development, :test]
gem "email_spec", ">= 1.2.1", :group => :test
gem "bootstrap-sass", ">= 2.1.0.0"
gem "quiet_assets", ">= 1.0.1", :group => :development

group :development do
  gem 'annotate'
  gem 'pry'
  gem 'pry-rails'
  gem 'nokogiri'
  gem 'sqlite3'
  gem 'mechanize'
end

group :production do
  #gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
  gem 'pg'
  gem 'dalli'
end
