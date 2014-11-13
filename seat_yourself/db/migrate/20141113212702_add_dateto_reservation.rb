class AddDatetoReservation < ActiveRecord::Migration
  def change
  	   add_column :reservations, :reservation_time, :time
  end
end
