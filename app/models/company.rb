class Company < ApplicationRecord
  has_many :complaints

  validates :name,
  length: { in: 1..50 },
  on: :create

  validates :email,
  uniqueness: true,
  email: true,
  on: :create
end
