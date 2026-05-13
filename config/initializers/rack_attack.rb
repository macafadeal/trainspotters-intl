# frozen_string_literal: true

class Rack::Attack
  Rack::Attack.cache.store = if Rails.env.production?
    ActiveSupport::Cache::RedisCacheStore.new(
      url: ENV.fetch("REDIS_URL", "redis://localhost:6379/1")
    )
  else
    ActiveSupport::Cache::MemoryStore.new
  end

  # Throttle all requests by IP (simple baseline); excludes static assets and health check.
  throttle("req/ip", limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?("/assets", "/up")
  end

  # Throttle login attempts.
  throttle("logins/ip", limit: 10, period: 10.minutes) do |req|
    if req.post? && req.path == "/users/sign_in"
      req.ip
    end
  end
end
