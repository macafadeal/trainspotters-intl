# frozen_string_literal: true

require "test_helper"

class TrainPolicyTest < ActiveSupport::TestCase
  def setup
    @owner = create_user(email: "owner@example.com", password: "password1")
    @other = create_user(email: "other@example.com", password: "password1")
    @train = create_train(user: @owner)
  end

  # --- index ---

  test "index is permitted for guests" do
    assert TrainPolicy.new(nil, @train).index?
  end

  test "index is permitted for signed-in users" do
    assert TrainPolicy.new(@owner, @train).index?
  end

  # --- show ---

  test "show is permitted for guests" do
    assert TrainPolicy.new(nil, @train).show?
  end

  test "show is permitted for signed-in users" do
    assert TrainPolicy.new(@owner, @train).show?
  end

  # --- create ---

  test "create is permitted for signed-in users" do
    assert TrainPolicy.new(@owner, @train).create?
  end

  test "create is not permitted for guests" do
    assert_not TrainPolicy.new(nil, @train).create?
  end

  # --- update / edit ---

  test "update is permitted for the owner" do
    assert TrainPolicy.new(@owner, @train).update?
  end

  test "update is not permitted for another user" do
    assert_not TrainPolicy.new(@other, @train).update?
  end

  test "update is not permitted for guests" do
    assert_not TrainPolicy.new(nil, @train).update?
  end

  test "edit mirrors update" do
    assert TrainPolicy.new(@owner, @train).edit?
    assert_not TrainPolicy.new(@other, @train).edit?
  end

  # --- destroy ---

  test "destroy is permitted for the owner" do
    assert TrainPolicy.new(@owner, @train).destroy?
  end

  test "destroy is not permitted for another user" do
    assert_not TrainPolicy.new(@other, @train).destroy?
  end

  test "destroy is not permitted for guests" do
    assert_not TrainPolicy.new(nil, @train).destroy?
  end

  # --- scope ---

  test "scope resolves to all trains regardless of user" do
    create_train(user: @other, series: "ICE 4", manufacturer: "Siemens", main_operator: "DB")
    assert_equal Train.count, TrainPolicy::Scope.new(@owner, Train).resolve.count
    assert_equal Train.count, TrainPolicy::Scope.new(nil, Train).resolve.count
  end
end
