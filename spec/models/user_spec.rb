require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Valid Example', email: 'examples@valid.com', password_digest: '1111111')
  end

  context 'valid user' do
    it 'should validate user instance' do
      expect(@user.valid?).to eq true
    end
  end

  context 'invalid user' do
    it 'too short name ( <6 )' do
      @user.name = 'ok'
      expect(@user.valid?).to eq false
      @user.name = 'Valid'
    end

    it 'too short password' do
      @user.password_digest = '11111'
      expect(@user.valid?).to eq false
      @user.password_digest = '1111111'
    end

    it 'wrong format email' do
      @user.email = 'gaciatgmai.com'
      expect(@user.valid?).to eq false
      @user.email = 'examples@vaalid.com'
    end

    it 'not unique email' do
      user2 = User.new(name: 'Valid Example', email: 'example@valid.com', password_digest: '1111111')
      expect(user2.valid?).to eq false
    end

    it 'too short email' do
      @user.email= 'a@a.com'
      expect(@user.valid?).to eq false
      @user.email= 'examples@valid.com'
    end


  end

end
