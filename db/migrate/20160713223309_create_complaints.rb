class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :description
      t.text :screenshot
      t.references :company, foreign_key: true
      t.integer :vote_count

      t.timestamps
    end
  end
end
