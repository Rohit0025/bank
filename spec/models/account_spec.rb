require 'rails_helper'

RSpec.describe Acccount, type: :model do
  context 'account validation' do
    it 'should valid account' do
      FactoryGirl.build(:account).should be_valid
    end

    it 'should invalid without date_of_opening' do
    	FactoryGirl.build(:account, date_of_opening: nil).should_not be_valid
    end 

    it 'should invalid without type' do
    	FactoryGirl.build(:account, type: nil).should_not be_valid
    end 

    it 'should invalid without account_no' do
    	FactoryGirl.build(:account, acccount_no: nil).should_not be_valid
    end 
 
    it 'should invalid without a name' do
      FactoryGirl.build(:account, name: nil).should_not be_valid
    end

    it 'should invalid without a address' do
      FactoryGirl.build(:account, address: nil).should_not be_valid
    end

    it 'should invalid without a balance' do
      FactoryGirl.build(:account, balance: nil).should_not be_valid
    end

    it 'should invalid without valid_amount' do
      FactoryGirl.build(:account, valid_amount: 00.00).should_not be_valid
    end
