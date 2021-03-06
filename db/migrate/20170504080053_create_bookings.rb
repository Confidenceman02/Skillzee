class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true, presence: true
      t.references :course_date, foreign_key: true
      t.timestamps
    end
  end
end