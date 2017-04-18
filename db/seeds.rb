# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |t|
  Product.create(
    color: ['black', 'white', 'red', 'blue', 'green'].sample,
    price: rand(10..500),
    weight: rand(5..50),
    height: rand(100..200),
    width: rand(10..50),
    material: ['wood', 'glass', 'iron'].sample,
    fragile: [true, false].sample,
    fast_delivery: [true, false].sample,
    discount: [5, 10, 15, 25].sample,
    amount: [0, 10, 20].sample
  )
end
