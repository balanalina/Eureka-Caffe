require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  before do
    @user = { name: 'Valid Example', email: 'valid@valid.com',
              password: '1111111', password_confirmation: '1111111' }
    post users_url, params: { user: @user }
    delete logout_url
  end

  context 'successful login' do
    it 'should get login page' do
      get login_url
      expect(response).to have_http_status(:success)
    end

    it 'should redirect to user profile' do
      post login_url, params: { session: { email: 'valid@valid.com', password: '1111111' } }
      expect(response).to have_http_status(:redirect)
    end
  end

end
