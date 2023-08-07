source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'pg', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'activestorage-cloudinary-service'
gem 'cloudinary'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'mechanize'
gem 'sidekiq', '~> 7.0.8'
gem 'sidekiq-cron'
gem 'sidekiq-limit_fetch'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rack-cors'
  gem 'rails-controller-testing'
  gem 'redis-rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'shoulda-matchers'
  gem 'webmock'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'fuubar'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'webdrivers'
end
