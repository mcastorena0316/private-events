require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(email: 'foobar@example.com', name: 'foobar')
  end

  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      expect(@user.name).to be_present
    end

    it 'should have a email' do
      expect(@user.email).to be_present
    end
  end

  context 'with invalid details' do
    it 'should not be valid' do
      @user.name = "    "
      expect(@user).to_not be_valid
    end

    it 'should have a unique email adress' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to_not be_valid
    end
  end
end
