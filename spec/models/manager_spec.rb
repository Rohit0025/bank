require 'rails_helper'

RSpec.describe Manager, type: :model do
  context 'manager validation' do
    it 'should valid manager' do
      FactoryGirl.build(:manager).should be_valid
    end

    it 'should invalid without name' do
    	FactoryGirl.build(:manager, name: nil).should_not be_valid
    end 

    it 'should invalid without address' do
    	FactoryGirl.build(:manager, address: nil).should_not be_valid
    end 

    it 'should invalid without age' do
    	FactoryGirl.build(:manager, age: nil).should_not be_valid
    end 

    it 'should invalid without salary' do
    	FactoryGirl.build(:manager, salary: nil).should_not be_valid
    end 

    it 'should invalid without phone_no' do
    	FactoryGirl.build(:manager, phone_no: nil).should_not be_valid
    end 

    it 'should invalid with small age' do
    	FactoryGirl.build(:manager, age:15 ).should_not be_valid
    end 

    it 'should invalid zero salary' do
    	FactoryGirl.build(:manager, salary: 00.00).should_not be_valid
    end 