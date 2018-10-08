class Account < ApplicationRecord
  belongs_to :branch
  belongs_to :user
  has_many :transactions
  validates :type, :date_of_opening, :account_no, :balance , presence: true
  validates :balance, numericality: true
  validates :account_no, inclusion: { in: %w(Saving_Account Current_Account)}
  validate :check_valid_amount, on: [:create]
  validate :check_balance_have_non_zero
  
  private
  
   def check_valid_amount
    if self.balance < 500.00
      errors.add(:base, "can't open an Account")
    end
  end
  def check_balance_have_non_zero
  	if self.balance <= 0.00
  		errors.add(:balance, "can not open account")
  	end
  end
  
end