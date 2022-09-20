require "application_system_test_case"

class GroupOperationsTest < ApplicationSystemTestCase
  setup do
    @group_operation = group_operations(:one)
  end

  test "visiting the index" do
    visit group_operations_url
    assert_selector "h1", text: "Group operations"
  end

  test "should create group operation" do
    visit group_operations_url
    click_on "New group operation"

    fill_in "Group", with: @group_operation.group_id
    fill_in "Operation", with: @group_operation.operation_id
    click_on "Create Group operation"

    assert_text "Group operation was successfully created"
    click_on "Back"
  end

  test "should update Group operation" do
    visit group_operation_url(@group_operation)
    click_on "Edit this group operation", match: :first

    fill_in "Group", with: @group_operation.group_id
    fill_in "Operation", with: @group_operation.operation_id
    click_on "Update Group operation"

    assert_text "Group operation was successfully updated"
    click_on "Back"
  end

  test "should destroy Group operation" do
    visit group_operation_url(@group_operation)
    click_on "Destroy this group operation", match: :first

    assert_text "Group operation was successfully destroyed"
  end
end
