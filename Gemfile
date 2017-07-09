source 'https://rubygems.org'
ruby "2.3.3"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg', '~> 0.18'
gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'uglifier', '>= 1.3.0'
gem 'foundation-rails'
gem 'jbuilder', '~> 2.5'
gem 'net-ssh'
gem 'httparty'
gem 'json'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'valid_attribute'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'coveralls', require: false
  gem 'capybara-webkit'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
