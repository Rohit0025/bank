require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user validation' do
    it 'should valid user' do
      FactoryGirl.build(:user).should be_valid
    end

    it 'should invalid without name' do
    	FactoryGirl.build(:User, name: nil).should_not be_valid
    end 

    it 'should invalid without address' do
    	FactoryGirl.build(:User, address: nil).should_not be_valid
    end 

    it 'should invalid without marital_status' do
    	FactoryGirl.build(:User, marital_status: nil).should_not be_valid
    end 

    it 'should invalid without age' do
    	FactoryGirl.build(:User, age: nil).should_not be_valid
    end

    it 'should invalid without date_of_birth' do
    	FactoryGirl.build(:User, date_of_birth: nil).should_not be_valid
    end 

    it 'should invalid without contact_no' do
    	FactoryGirl.build(:User, contact_no: nil).should_not be_valid
    end 

    context 'user associations' do
    it 'should has many accounts' do
      @user = FactoryGirl.create(:, bank_id: @bank.id)
      @user.accounts.should include @account
    end

    context 'user associations' do
    it 'should has many loans' do
      @user = FactoryGirl.create(:, bank_id: @bank.id)
      @user.loans.should include @loan
    end