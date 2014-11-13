class Restaurant < ActiveRecord::Base
	has_many :reservations
	belongs_to :owners
	has_many :customers, through: :reservations
end
