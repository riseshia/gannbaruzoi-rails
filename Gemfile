source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", ">= 5.0.0.beta4", "< 5.1"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.3.18", "< 0.5"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

gem "sprockets"
gem "sprockets-es6"

# Use jquery as the JavaScript library
gem "jquery-rails"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"
gem "devise"
gem "omniauth-github"
gem "figaro"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

gem "kaminari"

group :development, :test do
  # Call "byebug" anywhere in the code to stop
  # execution and get a debugger console
  gem "byebug", platform: :mri
end

group :development do
  gem "capistrano", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano-rails",   require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma",   require: false
  
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "rubocop", require: false
  gem "rails_best_practices", require: false
end

group :test do
  gem "minitest-rails"
  gem "shoulda"
  gem "factory_girl_rails"
  gem "database_rewinder"
  gem "codeclimate-test-reporter", require: false
end

