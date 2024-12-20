source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Rails Gem
gem "rails", "~> 7.0.4", ">= 7.0.4.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

# Redis adapter to run Action Cable in production (optional)
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Sass for processing CSS (Uncomment to use Sass)
 gem 'sassc-rails'

group :development, :test do
  # Debugging in development [https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem]
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Console on exception pages [https://github.com/rails/web-console]
  gem "web-console"

  # System testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Speed up testing commands
  gem "rack-mini-profiler"
end

group :development do
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines [https://github.com/rails/spring]
  # gem "spring"
end

# Additional Gems
gem "devise", "~> 4.8", ">= 4.8.1"
gem "friendly_id", "~> 5.4", ">= 5.4.2"
gem "cssbundling-rails"
gem "name_of_person"
gem "sidekiq", "~> 6.5", ">= 6.5.4"
gem "sinatra", require: nil
gem "stripe"
gem "pg", "1.3.5"
gem "dotenv-rails"

# Rails Admin
gem 'rails_admin'

gem 'chartkick'
gem 'groupdate'

