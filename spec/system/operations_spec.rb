require 'rails_helper'

RSpec.describe 'Operations', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
    @group = @user.groups.create(name: 'trip', icon: 'https://google.com')
    @operation = @user.operations.create(name: 'las vegas', amount: 23.23)
    @group_operation = @operation.group_operations.create(group_id: @group.id, operation_id: @operation.id)
    sign_in @user
  end

  it 'should show correct operation ' do
    visit group_operations_path(@group)
    expect(page).to have_content(@operation.name)
  end

  it 'should have the correct amount' do
    visit group_operations_path(@group)
    expect(page).to have_content(@operation.amount)
  end

  it 'should redirect to add new transaction' do
    visit group_operations_path(@group)
    click_on 'Add Transaction'
    expect(page).to have_current_path(new_group_operation_path(@group))
  end
end