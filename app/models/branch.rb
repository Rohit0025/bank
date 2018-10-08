class Branch < ApplicationRecord
  belongs_to :bank
  has_one :manager, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :loans, dependent: :destroy
  validates :code, :address, :phone_no, presence: true
  validates :code, numerically: { only_integer: true }
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
  
end