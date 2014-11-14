class Owner < ActiveRecord::Base
	has_secure_password
	has_many :restaurants

	validates :email, presence: true
	validates :email, uniqueness: { message: "This email already has an account set up. Please use a different email."}
end
