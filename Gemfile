source 'http://rubygems.org'
ruby '1.9.3'

gem 'railties', '4.0.0'
gem 'rails', '4.0.0'
gem 'bcrypt-ruby', '3.0.0'
gem 'protected_attributes'
gem 'rails_best_practices'
gem 'reek'
 gem 'launchy'
 gem 'database_cleaner'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'capybara'
end

group :production do
  #  gem 'pg'
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
  gem 'thin'

end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails', "  ~> 4.0"
  gem 'coffee-rails', "~> 4.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
