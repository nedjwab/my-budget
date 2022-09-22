require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
    @group = @user.groups.create(name: 'trip', icon: 'https://google.com')
    sign_in @user
  end

  it 'should show correct category name ' do
    visit groups_path
    expect(page).to have_content(@group.name)
  end

  it 'should redirect to add new category' do
    visit groups_path
    click_on 'Add Category'
    expect(page).to have_current_path(new_group_path)
  end
end
