require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'transaction validation' do
    it 'should valid transaction' do
      FactoryGirl.build(:transaction).should be_valid
    end

    it 'should invalid without amount' do
    	FactoryGirl.build(:transaction, amount: nil).should_not be_valid
    end 

    it 'should invalid without valid_amount' do
    	FactoryGirl.build(:transaction, valid_amount: 0.00).should_not be_valid
    end 

    it 'should invalid without date' do
    	FactoryGirl.build(:transaction, date: nil).should_not be_valid
    end 
 
    it 'should invalid without operation' do
      FactoryGirl.build(:transaction, operation: nil).should_not be_valid
    end

  
