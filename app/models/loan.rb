class Atm < ApplicationRecord
  belongs_to :branch
  belongs_to :user
  validates :type, :amount, :rate, :time_limit, presence: true
  validates :amount, :rate, :time_limit, numericality: true
  validates :type, inclusion: { in: %w(Home_Loan Car_Loan Education_Loan PersonaL_Loan Business_Loan)}
end
