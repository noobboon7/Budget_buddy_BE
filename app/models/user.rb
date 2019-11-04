class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :budgets
  has_many :expenses, through: :budgets
end
