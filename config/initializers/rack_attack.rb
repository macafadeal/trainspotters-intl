# frozen_string_literal: true

class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Throttle all requests by IP (simple baseline).
  throttle("req/ip", limit: 300, period: 5.minutes) do |req|
    req.ip if req.path.start_with?("/")
  end

  # Throttle login attempts.
  throttle("logins/ip", limit: 10, period: 10.minutes) do |req|
    if req.post? && req.path == "/users/sign_in"
      req.ip
    end
  end
end
