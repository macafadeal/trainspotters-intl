# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts('Destroying all entries in Train AND User')
Train.destroy_all
User.destroy_all

puts('Creating user1')
user1 = User.new(email: 'a@ba.com', password: '123456')
user1.save

puts('Creating train1')
train1 =
  Train.new(
    user_id: user1.id,
    manufacturer: 'Siemens',
    series: 'S-103',
    main_operator: 'renfe'
  )

puts('Creating train2')
train2 =
  Train.new(
    user_id: user1.id,
    manufacturer: 'Hitachi, Kawasaki Heavy Industries',
    series: 'E5 series',
    main_operator: 'JR-EAST'
  )
puts('Creating train3')
train3 =
  Train.new(
    user_id: user1.id,
    manufacturer: 'Fiat Ferroviaria',
    series: '4000',
    main_operator: 'Comboios de Portugal'
  )

train1.save
train2.save
train3.save
