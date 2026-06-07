# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "GET / returns 200" do
    get root_path
    assert_response :success
  end

  test "home page shows the app name" do
    get root_path
    assert_select "h1", text: /Trainspotters Int'l/i
  end

  test "home page shows Explore Gallery link" do
    get root_path
    assert_select "a[href='#{trains_path}']"
  end

  test "home page shows Join the Community link for guests" do
    get root_path
    assert_select "a[href='#{new_user_registration_path}']"
  end

  test "home page does not show Join the Community link for signed-in users" do
    sign_in create_user
    get root_path
    assert_select "a[href='#{new_user_registration_path}']", count: 0
  end
end
