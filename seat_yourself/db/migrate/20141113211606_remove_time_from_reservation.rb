class RemoveTimeFromReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :time, :datetime
  end
end
