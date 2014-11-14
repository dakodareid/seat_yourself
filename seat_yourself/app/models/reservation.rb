class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

	validates :reservation_time, :reservation_date, :party_size, presence: true
	validates :party_size,
		inclusion: { in: 1..20, message: "We can only accommodate a maximum parties up to 20 people" }

	validate  :in_future 
	#:on_the_hour
	#:restaurant_open, :restaurant_not_full,
  	def in_future

    	dt = DateTime.new(reservation_date.year, reservation_date.month, reservation_date.day, 
    		reservation_time.hour, reservation_time.min, reservation_time.sec)

    	if dt < DateTime.now
      		errors.add(:datetime, "All reservations must be made for a future time")
      	end
  	end

  	def restaurant_open

  	end
end
