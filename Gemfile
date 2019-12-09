group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'webmock'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Use guard only for testing
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
end