require 'rails_helper'

RSpec.describe Loan, type: :model do
  context 'loan validation' do
    it 'should valid loan' do
      FactoryGirl.build(:loan).should be_valid
    end

    it 'should invalid without type' do
    	FactoryGirl.build(:loan, type: nil).should_not be_valid
    end 

    it 'should invalid without amount' do
    	FactoryGirl.build(:loan, amount: nil).should_not be_valid
    end 

    it 'should invalid without rate' do
    	FactoryGirl.build(:loan, rate: nil).should_not be_valid
    end 

    it 'should invalid without time_limit' do
    	FactoryGirl.build(:loan, time_limit: nil).should_not be_valid
    end 