require "test_helper"

class GroupOperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_operation = group_operations(:one)
  end

  test "should get index" do
    get group_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_group_operation_url
    assert_response :success
  end

  test "should create group_operation" do
    assert_difference("GroupOperation.count") do
      post group_operations_url, params: { group_operation: { group_id: @group_operation.group_id, operation_id: @group_operation.operation_id } }
    end

    assert_redirected_to group_operation_url(GroupOperation.last)
  end

  test "should show group_operation" do
    get group_operation_url(@group_operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_operation_url(@group_operation)
    assert_response :success
  end

  test "should update group_operation" do
    patch group_operation_url(@group_operation), params: { group_operation: { group_id: @group_operation.group_id, operation_id: @group_operation.operation_id } }
    assert_redirected_to group_operation_url(@group_operation)
  end

  test "should destroy group_operation" do
    assert_difference("GroupOperation.count", -1) do
      delete group_operation_url(@group_operation)
    end

    assert_redirected_to group_operations_url
  end
end
