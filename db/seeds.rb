# frozen_string_literal: true

puts "Seeding database..."

demo_user = User.find_or_create_by!(email: "test@test.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end
puts "Demo user: #{demo_user.email} / password123"

sample_trains = [
  {manufacturer: "Alstom", series: "TGV Duplex", main_operator: "SNCF"},
  {manufacturer: "Alstom", series: "Pendolino ETR", main_operator: "Trenitalia"},
  {manufacturer: "Bombardier", series: "Acela", main_operator: "Amtrak"},
  {manufacturer: "Bombardier", series: "Eurostar e300", main_operator: "Eurostar"},
  {manufacturer: "CAF", series: "Civity", main_operator: "Renfe"},
  {manufacturer: "CRRC", series: "CR400AF", main_operator: "China Railway"},
  {manufacturer: "Hitachi", series: "N700S", main_operator: "JR Central"},
  {manufacturer: "Kawasaki", series: "E5 Series", main_operator: "JR East"},
  {manufacturer: "Siemens", series: "ICE 3", main_operator: "Deutsche Bahn"},
  {manufacturer: "Siemens", series: "Velaro E", main_operator: "Renfe"},
  {manufacturer: "Stadler Rail", series: "FLIRT", main_operator: "SBB"},
  {manufacturer: "Talgo", series: "Talgo 350", main_operator: "Renfe"}
]

sample_trains.each do |attrs|
  Train.find_or_create_by!(user: demo_user, series: attrs[:series]) do |t|
    t.manufacturer = attrs[:manufacturer]
    t.main_operator = attrs[:main_operator]
  end
end

puts "Done: #{Train.count} trains, #{User.count} users."
