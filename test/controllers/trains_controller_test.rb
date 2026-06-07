# frozen_string_literal: true

require "test_helper"

class TrainsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = create_user(email: "owner@example.com", password: "password1")
    @other = create_user(email: "other@example.com", password: "password1")
    @train = create_train(user: @owner)
  end

  # --- index ---

  test "GET /trains is accessible to guests" do
    get trains_path
    assert_response :success
  end

  test "GET /trains is accessible to signed-in users" do
    sign_in @owner
    get trains_path
    assert_response :success
  end

  test "GET /trains accepts a valid sort param" do
    TrainsController::SORT_OPTIONS.each_key do |sort|
      get trains_path, params: {sort: sort}
      assert_response :success, "expected success for sort=#{sort}"
    end
  end

  test "GET /trains ignores an unknown sort param and falls back to default" do
    get trains_path, params: {sort: "invalid"}
    assert_response :success
  end

  # --- show ---

  test "GET /trains/:id is accessible to guests" do
    get train_path(@train)
    assert_response :success
  end

  test "GET /trains/:id is accessible to signed-in users" do
    sign_in @owner
    get train_path(@train)
    assert_response :success
  end

  # --- new ---

  test "GET /trains/new redirects guests to sign in" do
    get new_train_path
    assert_redirected_to new_user_session_path
  end

  test "GET /trains/new is accessible to signed-in users" do
    sign_in @owner
    get new_train_path
    assert_response :success
  end

  # --- create ---

  test "POST /trains redirects guests to sign in" do
    post trains_path, params: new_train_params
    assert_redirected_to new_user_session_path
  end

  test "POST /trains creates a train and redirects to it for signed-in users" do
    sign_in @owner
    assert_difference "Train.count" do
      post trains_path, params: new_train_params
    end
    assert_redirected_to train_path(Train.last)
  end

  test "POST /trains with invalid params renders new as unprocessable entity" do
    sign_in @owner
    post trains_path, params: {train: {manufacturer: "", series: "", main_operator: ""}}
    assert_response :unprocessable_entity
  end

  # --- edit ---

  test "GET /trains/:id/edit redirects guests to sign in" do
    get edit_train_path(@train)
    assert_redirected_to new_user_session_path
  end

  test "GET /trains/:id/edit is accessible to the owner" do
    sign_in @owner
    get edit_train_path(@train)
    assert_response :success
  end

  test "GET /trains/:id/edit is forbidden for a different user" do
    sign_in @other
    get edit_train_path(@train)
    assert_redirected_to root_path
  end

  # --- update ---

  test "PATCH /trains/:id redirects guests to sign in" do
    patch train_path(@train), params: new_train_params
    assert_redirected_to new_user_session_path
  end

  test "PATCH /trains/:id updates the train and redirects for the owner" do
    sign_in @owner
    patch train_path(@train), params: {train: {series: "Updated Series"}}
    assert_redirected_to train_path(@train)
    assert_equal "Updated Series", @train.reload.series
  end

  test "PATCH /trains/:id with invalid params renders edit as unprocessable entity" do
    sign_in @owner
    patch train_path(@train), params: {train: {series: ""}}
    assert_response :unprocessable_entity
  end

  test "PATCH /trains/:id is forbidden for a different user" do
    sign_in @other
    patch train_path(@train), params: new_train_params
    assert_redirected_to root_path
  end

  # --- destroy ---

  test "DELETE /trains/:id redirects guests to sign in" do
    delete train_path(@train)
    assert_redirected_to new_user_session_path
  end

  test "DELETE /trains/:id destroys the train and redirects for the owner" do
    sign_in @owner
    assert_difference "Train.count", -1 do
      delete train_path(@train)
    end
    assert_redirected_to trains_path
  end

  test "DELETE /trains/:id is forbidden for a different user" do
    sign_in @other
    assert_no_difference "Train.count" do
      delete train_path(@train)
    end
    assert_redirected_to root_path
  end

  private

  def new_train_params
    {train: {manufacturer: "Siemens", series: "ICE 4", main_operator: "DB"}}
  end
end
