class RemovestripefromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :stripe_charge_id, :string
  end
end
