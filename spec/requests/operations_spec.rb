require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
    @group = @user.groups.create(name: 'trip', icon: 'https://google.com')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get group_operations_path(@group)
      expect(response).to have_http_status(:success)
    end
  end
end