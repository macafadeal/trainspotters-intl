# frozen_string_literal: true

require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  config.cache_store = :redis_cache_store, {
    url: ENV.fetch("REDIS_URL", "redis://localhost:6379/0"),
    expires_in: 1.hour
  }

  config.public_file_server.headers = {"cache-control" => "public, max-age=#{1.year.to_i}"}
  config.active_storage.service = :cloudinary

  # TLS is terminated at the reverse proxy; tell Rails to treat all requests as HTTPS.
  config.assume_ssl = true
  config.force_ssl = false

  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.logger($stdout)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.silence_healthcheck_path = "/up"

  config.active_support.report_deprecations = false

  config.action_mailer.default_url_options = {
    host: ENV.fetch("APP_HOST", "trainspotters-intl.com"),
    protocol: "https"
  }

  config.i18n.fallbacks = true
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [:id]
end
