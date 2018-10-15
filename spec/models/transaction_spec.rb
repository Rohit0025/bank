require 'rails_helper'

describe transaction do

  context 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :operation}
    it { should validate_confirmation_of :operation}
    it { should validate_presence_of :amount } 
    it { should validate_confirmation_of :amount }
  end
   context 'associations' do
    it { belongs_to(:atm) } 
    it { belongs_to(:account) } 
  end
  context '#issue_to_transaction' do
     it 'not permitted invalid amount less then zero' do
    expect 'amount <=0.00'
  end
     it 'permitted valid salary less than equal to zero' do
    expect 'salary <=0'
  end
