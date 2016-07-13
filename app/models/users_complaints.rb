class UsersComplaints < ApplicationRecord
  belongs_to :user
  belongs_to :complaint
end
