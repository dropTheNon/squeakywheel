class Complaint < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_complaints
  belongs_to :company

  validates :title,
  presence: true

  validates :description,
  presence: true
end