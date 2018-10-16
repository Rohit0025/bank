require 'rails_helper'

RSpec.describe Atm, type: :model do
  context 'Atm validation' do
    it 'should valid atm' do
      FactoryGirl.build(:atm).should be_valid
    end

context 'atm associations' do
    it 'should has many transaction' do
      @transaction = FactoryGirl.create(:, bank_id: @bank.id)
      @transaction.atm.should include @transaction
    end
  
