class AddPaymentToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :payment, :boolean, default: false
  end
end