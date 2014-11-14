class Customer < ActiveRecord::Base
	has_secure_password

	has_many :reservations
	
	validates :email, presence: true
end
