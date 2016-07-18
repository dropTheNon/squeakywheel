class User < ApplicationRecord
  has_and_belongs_to_many :complaints, join_table: :users_complaints

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

  def set_password_reset
    # this will ensure users with duplicate codes
    self.reset_code = loop do 
      code = SecureRandom.urlsafe_base64
      break code unless User.exists?(reset_code: code)
    end
    # set the expiration date with some handy date methods
    self.expires_at = 4.hours.from_now
    self.save
  end

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
