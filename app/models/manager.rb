class Managers < ApplicationRecord
	belongs_to :branch
  validates :name, :address, :age, :salary, :phone_no ,presence:true
  validates :age, :salary , numericality: { only_integer: true }
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
  validate :check_age
  validate :check_salary
	private
 		def check_age
			if self.age < 18 
				errors.add(:age, "Not eligible to be a manager")
    	end
  	end
  	def check_salary
  		if self.salary <= 0
  			errors.add(:salary, "Not permitted invalid salary less than equal to zero")
  		end
  	end
end	