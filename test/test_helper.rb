# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
    fixtures :all

    def create_user(email: "user@example.com", password: "password1")
      User.create!(email: email, password: password, password_confirmation: password)
    end

    def create_train(user:, manufacturer: "Alstom", series: "TGV Duplex", main_operator: "SNCF")
      Train.create!(manufacturer: manufacturer, series: series, main_operator: main_operator, user: user)
    end
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
