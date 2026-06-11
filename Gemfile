# frozen_string_literal: true

source "https://rubygems.org"

ruby "4.0.3"

gem "rails", "~> 8.1.3"
gem "pg", "~> 1.5"
gem "puma", "~> 8.0"
gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "redis", "~> 5.0"
gem "bootsnap", ">= 1.17.0", require: false

gem "devise"
gem "simple_form"
gem "pundit"

gem "cloudinary", "~> 2.0"
gem "active_storage_validations"
gem "rack-attack"
gem "kaminari", "~> 1.2"
gem "ostruct"
gem "mutex_m"

group :development, :test do
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "standard"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "erb_lint", require: false
  gem "erb-formatter", require: false
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 4.0"
  gem "bullet"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i[windows jruby]
