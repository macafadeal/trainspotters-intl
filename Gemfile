# frozen_string_literal: true

source "https://rubygems.org"

ruby "4.0.5"

gem "rails", "~> 8.1"
gem "pg", "~> 1.6"
gem "puma", "~> 8.0"
gem "sprockets-rails", "~> 3.5"
gem "jsbundling-rails", "~> 1.3"
gem "cssbundling-rails", "~> 1.4"
gem "turbo-rails", "~> 2.0"
gem "stimulus-rails", "~> 1.3"
gem "redis", "~> 5.4"
gem "bootsnap", "~> 1.24", require: false

gem "devise", "~> 5.0"
gem "simple_form", "~> 5.4"
gem "pundit", "~> 2.5"

gem "cloudinary", "~> 2.4"
gem "active_storage_validations", "~> 3.0"
gem "rack-attack", "~> 6.8"
gem "kaminari", "~> 1.2"
gem "ostruct", "~> 0.6"
gem "mutex_m", "~> 0.3"

group :development, :test do
  gem "dotenv-rails", "~> 3.2"
  gem "pry-byebug", "~> 3.12"
  gem "pry-rails", "~> 0.3"
  gem "standard", "~> 1.55"
  gem "brakeman", "~> 8.0", require: false
  gem "bundler-audit", "~> 0.9", require: false
  gem "erb_lint", "~> 0.9", require: false
  gem "erb-formatter", "~> 0.7", require: false
end

group :development do
  gem "web-console", "~> 4.3"
  gem "rack-mini-profiler", "~> 4.0"
  gem "bullet", "~> 8.1"
  gem "foreman", "~> 0.90"
end

group :test do
  gem "capybara", "~> 3.40"
  gem "selenium-webdriver", "~> 4.45"
end

gem "tzinfo-data", platforms: %i[windows jruby]
