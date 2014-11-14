class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

	validates :restaurant, presence: true
	validates :reservation_time, :reservation_date, :party_size, presence: true
	validates :party_size,
		inclusion: { in: 1..20, message: "We can only accommodate a maximum parties up to 20 people" }

	validate  :in_future, :restaurant_open

	$OPENING_HOUR = 10
	$CLOSING_HOUR = 22

	validate :availability 
	
	def availability
		# binding.pry
		unless restaurant.present?
			errors.add(:base, "No restaurant for this reservation, apparently.")
			return
		end
		unless restaurant.available?(reservation_time, party_size)
			errors.add(:base, "Restaurant is full at this time")
		end
	end

  	def in_future
    	dt = DateTime.new(reservation_date.year, reservation_date.month, reservation_date.day, 
    		reservation_time.hour)

    	if dt < DateTime.now
      		errors.add(:datetime, "All reservations must be made for a future time")
      	end
  	end

  	def restaurant_open
		dt = DateTime.new(reservation_date.year, reservation_date.month, reservation_date.day, 
    		reservation_time.hour)

		if dt.hour < $OPENING_HOUR || dt.hour > $CLOSING_HOUR
			errors.add(:reservation_time, "Reservation cannot be made outside restaurant hours: 10AM - 10PM Daily")
		end
  	end


end
