class AddStripeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :stripe_charge_id, :string
  end
end
