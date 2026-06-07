# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def valid_user(overrides = {})
    User.new({
      email: "test@example.com",
      password: "password1",
      password_confirmation: "password1"
    }.merge(overrides))
  end

  # --- email ---

  test "valid with well-formed email and strong password" do
    assert valid_user.valid?
  end

  test "invalid without email" do
    user = valid_user(email: "")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "invalid with malformed email (no TLD)" do
    user = valid_user(email: "user@nodomain")
    assert_not user.valid?
    assert user.errors[:email].any?
  end

  test "invalid with malformed email (no @)" do
    user = valid_user(email: "notanemail")
    assert_not user.valid?
    assert user.errors[:email].any?
  end

  test "invalid when email is already taken" do
    valid_user.save!
    duplicate = valid_user
    assert_not duplicate.valid?
    assert user_errors_include?(duplicate, :email, "taken")
  end

  # --- password length ---

  test "invalid when password is shorter than 8 characters" do
    user = valid_user(password: "abc1", password_confirmation: "abc1")
    assert_not user.valid?
    assert user.errors[:password].any?
  end

  test "valid with exactly 8 character password" do
    user = valid_user(password: "abcdef1!", password_confirmation: "abcdef1!")
    assert user.valid?
  end

  # --- password complexity ---

  test "invalid when password has no digits" do
    user = valid_user(password: "onlyletters", password_confirmation: "onlyletters")
    assert_not user.valid?
    assert_includes user.errors[:password], "must include at least one letter and one number"
  end

  test "invalid when password has no letters" do
    user = valid_user(password: "12345678", password_confirmation: "12345678")
    assert_not user.valid?
    assert_includes user.errors[:password], "must include at least one letter and one number"
  end

  test "valid when password has letters and digits" do
    user = valid_user(password: "secure99", password_confirmation: "secure99")
    assert user.valid?
  end

  # --- password confirmation ---

  test "invalid when password confirmation does not match" do
    user = valid_user(password_confirmation: "different1")
    assert_not user.valid?
    assert user.errors[:password_confirmation].any?
  end

  # --- associations ---

  test "destroying user destroys associated trains" do
    user = valid_user
    user.save!
    user.trains.create!(manufacturer: "Alstom", series: "TGV", main_operator: "SNCF")
    assert_difference "Train.count", -1 do
      user.destroy!
    end
  end

  private

  def user_errors_include?(user, attribute, fragment)
    user.errors[attribute].any? { |msg| msg.include?(fragment) }
  end
end
