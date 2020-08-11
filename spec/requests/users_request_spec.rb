require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = { name: 'Valid Example', email: 'valid@valid.com', password: '1111111', password_confirmation: '1111111' }
  end

  context 'successful sign up' do
    it 'should get sign up page' do
      get signup_url
      expect(response).to have_http_status(:success)
    end

    it 'should redirect to user profile'  do
      post users_url, params: { user: @user }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(assigns(:user))
    end
  end

  context 'unsuccessful sign up' do
    it 'should render the form again' do
      @user[:name] = 'g'
      post users_url, params: { user: @user }
      expect(response).to have_http_status(200)
    end
  end
end
