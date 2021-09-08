# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts ('Destroying all entries in TrainEntry AND User')
TrainEntry.destroy_all
User.destroy_all

puts ('Creating user1')
user1 = User.new(email: 'a@ba.com', password: '123456')
user1.save

puts ('Creating train1')
train1 =
  TrainEntry.new(
    user_id: user1.id,
    manufacturer: 'Talgo',
    series: 'I',
    main_operator: 'RENFE'
  )

puts ('Creating train2')
train2 =
  TrainEntry.new(
    user_id: user1.id,
    manufacturer: 'Siemens',
    series: 'Civia x Generacíon',
    main_operator: 'RENFE Cercanías de Madrid'
  )
puts ('Creating train3')
train3 =
  TrainEntry.new(
    user_id: user1.id,
    manufacturer: 'CAF - Construcciones y Auxiliar de Ferrocarriles',
    series: '452',
    main_operator: 'RENFE Cercanías de Madrid'
  )

train1.save
train2.save
train3.save
