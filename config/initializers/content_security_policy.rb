# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src :self, :https, :data,
      "fonts.gstatic.com"
    policy.img_src :self, :https, :data,
      "res.cloudinary.com",
      "images.unsplash.com",
      "upload.wikimedia.org"
    policy.object_src :none
    policy.script_src :self, :https
    policy.style_src :self, :https,
      "fonts.googleapis.com"

    # If you wire up a report endpoint later, enable this.
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Enforce in production; report-only in development so local testing isn't blocked.
  config.content_security_policy_report_only = Rails.env.development?
end
