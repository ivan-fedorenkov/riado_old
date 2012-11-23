source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
end

gem 'twitter-bootstrap-rails'
gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.5'
  gem 'railroady'
end

group :test do
  # Pretty printed test output
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
end

gem 'haml'
gem "factory_girl_rails", "~> 4.0"
gem 'faker'
gem 'rails-i18n'
