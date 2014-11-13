class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

	validates :reservation_time, :reservation_date, :party_size, presence: true
end
