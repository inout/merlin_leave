require 'test_helper'

class LeavesControllerTest < ActionController::TestCase
  setup do
    @leafe = leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leafe" do
    assert_difference('Leave.count') do
      post :create, leafe: { approved_on: @leafe.approved_on, approver_id: @leafe.approver_id, leave_notes: @leafe.leave_notes, leave_type: @leafe.leave_type, requested_on: @leafe.requested_on, requestor_id: @leafe.requestor_id }
    end

    assert_redirected_to leafe_path(assigns(:leafe))
  end

  test "should show leafe" do
    get :show, id: @leafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leafe
    assert_response :success
  end

  test "should update leafe" do
    put :update, id: @leafe, leafe: { approved_on: @leafe.approved_on, approver_id: @leafe.approver_id, leave_notes: @leafe.leave_notes, leave_type: @leafe.leave_type, requested_on: @leafe.requested_on, requestor_id: @leafe.requestor_id }
    assert_redirected_to leafe_path(assigns(:leafe))
  end

  test "should destroy leafe" do
    assert_difference('Leave.count', -1) do
      delete :destroy, id: @leafe
    end

    assert_redirected_to leaves_path
  end
end
