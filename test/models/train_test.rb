# frozen_string_literal: true

require "test_helper"

class TrainTest < ActiveSupport::TestCase
  def setup
    @user = create_user
  end

  def valid_train(overrides = {})
    Train.new({manufacturer: "Alstom", series: "TGV Duplex", main_operator: "SNCF", user: @user}.merge(overrides))
  end

  # --- presence ---

  test "valid with all required fields" do
    assert valid_train.valid?
  end

  test "invalid without manufacturer" do
    train = valid_train(manufacturer: "")
    assert_not train.valid?
    assert train.errors[:manufacturer].any?
  end

  test "invalid without series" do
    train = valid_train(series: "")
    assert_not train.valid?
    assert train.errors[:series].any?
  end

  test "invalid without main_operator" do
    train = valid_train(main_operator: "")
    assert_not train.valid?
    assert train.errors[:main_operator].any?
  end

  # --- length ---

  test "invalid when manufacturer exceeds 255 characters" do
    train = valid_train(manufacturer: "A" * 256)
    assert_not train.valid?
    assert train.errors[:manufacturer].any?
  end

  test "invalid when series exceeds 255 characters" do
    train = valid_train(series: "A" * 256)
    assert_not train.valid?
    assert train.errors[:series].any?
  end

  test "invalid when main_operator exceeds 255 characters" do
    train = valid_train(main_operator: "A" * 256)
    assert_not train.valid?
    assert train.errors[:main_operator].any?
  end

  test "valid when fields are exactly 255 characters" do
    assert valid_train(manufacturer: "A" * 255, series: "B" * 255, main_operator: "C" * 255).valid?
  end

  # --- associations ---

  test "belongs to a user" do
    assert_respond_to valid_train, :user
  end

  test "invalid without a user" do
    train = valid_train(user: nil)
    assert_not train.valid?
    assert train.errors[:user].any?
  end

  test "has one attached photo" do
    assert_respond_to valid_train, :photo
  end
end
