class Transaction < ApplicationRecord
	belongs_to :atm
	belongs_to :account
	validates :date, :operation, :amount, presence: true
	validates :amount, numericality: true
	validates :operation, inclusion: { in: %w(deposite withdrawal)}
	validate :check_amount  
	validate :withdrawal_amount_and_check_balance
	validate :withdrawal_amount
	after_save :update_balance
	private
	
	def check_amount
		if self.check_amount <= 0.00 
			errors.add(:amount, "not permitted invalid amount less than zero")
		end
	end
	
	def withdrawal_amount_and_check_balance
		if self.operation == "withdrawal" && self.account.balance < self.amount 
			errors.add(:amount, "not permitted invalid amount balance not enough")
		end
	end
	
	def withdrawal_amount
		if self.amount % 100.00 == 0.00 && self.operation == "withdrawal"
			errors.add(:amount, "not permitted invalid amount not multiple of 100")
		end
	end
	
	def update_balance
		if self.operation == "deposit"
			new_balance = self.account.balance + self.amount
		else
			new_balance = self.account.balance - self.amount
		end
		unless self.account.update_attributes(balance: new_balance)
			raise "request cannot be processed"
		end
	end
end