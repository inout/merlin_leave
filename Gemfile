source 'http://rubygems.org'

gem 'heroku'
gem 'rails', '3.2.5'

group :test do
  gem "cucumber-rails"
  gem "factory_girl_rails", "~> 3.0"
  gem "database_cleaner"
  gem "timecop"
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails"
end

group :production do
  gem 'thin'
  gem 'pg'
end

gem 'active_scaffold', '3.2.7'
gem 'devise'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

