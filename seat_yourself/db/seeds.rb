# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c = Customer.create!(
	name: "Bobby",
	email: "bob@example.com",
	password: "asdf",
	password_confirmation: "asdf"
)

o = Owner.create!(
	name: "Joe Owner",
	email: "joe@example.com",
	password: "asdf",
	password_confirmation: "asdf"
)

r = Restaurant.create!(
	name: "A & W",
  	description: "Root for the best!",
  	seats: 50,
  	url: "aandw.com"
)

o.restaurants << r
o.save

res = Reservation.create!(
  party_size: 4,
  reservation_date: Date.new(2014, 12, 12),
  reservation_time: Time.new(2014, 12, 12 , 11),
  restaurant_id: r.id,
  customer_id: c.id
)
res.save