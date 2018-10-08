class User < ApplicationRecord
  has_many :accounts
  has_many :loans
  validates :name, :address, :marital_status, :age, :date_of_birth, :contact_no,presence: true
  validates :age ,:contact_no , numericality: { only_integer: true }
  validates :contact_no, uniqueness: true, length:{is: 10}
  validates :marital_status , inclusion: { in: %w(Married Unmarried)}
  validate :user_permitted_for_account

  private
  
   def user_permitted_for_account
    if self.age < 18 
      errors.add(:base, "not permitted for Account")
    end
  end
end