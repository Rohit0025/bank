require 'rails_helper'

RSpec.describe Branch, type: :model do
  context 'branch validation' do
    it 'should valid branch
    ' do
      FactoryGirl.build(:branch).should be_valid
    end

    it 'should invalid without code' do
    	FactoryGirl.build(:branch, code: nil).should_not be_valid
    end 

    it 'should invalid without address' do
    	FactoryGirl.build(:branch, address: nil).should_not be_valid
    end 

    it 'should invalid without phone_no' do
    	FactoryGirl.build(:branch, phonr_no: nil).should_not be_valid
    end 
 
    it 'should invalid without phone_no' do
      FactoryGirl.build(:branch, operation: nil).should_not be_valid
    end

    it 'should invalid with short phone_no' do
      FactoryGirl.build(:branch, phone_no: Faker::Number.number(5)).should_not be_valid
    end

    it 'should invalid with long phone_no' do
      FactoryGirl.build(:branch, phone_no: Faker::Number.number(11)).should_not be_valid
    end

     context 'branch associations' do
    it 'should has many accounts' do
      @branch = FactoryGirl.create(:branch)
      @account = FactoryGirl.create(:account, bank_id: @bank.id)
      @branch.account.should include @account
   
    end

    it 'should has many loans' do
      @branch = FactoryGirl.create(:branch)
      @loan = FactoryGirl.create(:loan, bank_id: @bank.id)
      @branch.loans.should include @loan
    end

    it 'should has one manager' do
      @branch = FactoryGirl.create(:branch)
      @manager = FactoryGirl.create(:manager, bank_id: @bank.id)
      @branch.managers.should include @manager
    end

  

