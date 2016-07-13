class CreateUsersComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :users_complaints do |t|
      t.references :user, foreign_key: true
      t.references :complaint, foreign_key: true

      t.timestamps
    end
  end
end
