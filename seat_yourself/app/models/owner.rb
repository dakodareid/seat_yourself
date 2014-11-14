class Owner < ActiveRecord::Base
	has_secure_password
	has_many :restaurants

	validates :email, presence: true
end
