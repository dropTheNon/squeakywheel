class User < ApplicationRecord
  has_and_belongs_to_many :complaints

  has_secure_password

  validates :password,
  length: { in: 8..72 },
  on: :create

  validates :name,
  length: { in: 1..50 },
  on: :create

  validates :email,
  uniqueness: true,
  email: true,
  on: :create

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
