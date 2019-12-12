# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Table.delete_all
User.delete_all

nation = Faker::Nation.nationality
  if nation[-1].include? "s"
    nation.chomp('s')
  end

super_user = User.create(
  full_name: "Dustin Tobin",
  password: "wew",
  is_admin: true,
  rsvp: 1,
  allergies: "None",
  nationality: "Canadian",
  email: "nice@meme.gov",
  phone: "9999999999"

)

70.times do
  full_name = Faker::Name.name
  nation = ['Canadian', 'Japanese', "#{Faker::Nation.language}"].sample

  User.create(
    full_name: full_name,
    phone: Faker::PhoneNumber.phone_number,
    is_admin: false,
    email: "#{full_name.gsub(/\s+/, "").downcase}@example.com",
    password: 'wew',
    allergies: 'None',
    nationality: nation
  )
end