class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy
  has_many :atms, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :loans, dependent: :destroy
  validates :name, :address, :phone_no, presence: true
  validates :phone_no, length: { is: 10 }, numericality: { only_integer: true }
end
