# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = ENV.fetch("DEVISE_MAILER_SENDER", "noreply@trainspotters-intl.com")

  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.email_regexp = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
