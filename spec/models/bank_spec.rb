require 'rails_helper'

RSpec.describe Bank, type: :model do
  context 'bank validation' do
    it 'should valid bank' do
      FactoryGirl.build(:bank).should be_valid
    end

    it 'should invalid without amount' do
    	FactoryGirl.build(:bank, amount: nil).should_not be_valid
    end 

    it 'should invalid without valid_amount' do
    	FactoryGirl.build(:bank, valid_amount: 0.00).should_not be_valid
    end 

    it 'should invalid without date' do
    	FactoryGirl.build(:bank, date: nil).should_not be_valid
    end 
 
    it 'should invalid without operation' do
      FactoryGirl.build(:bank, operation: nil).should_not be_valid
    end

  
