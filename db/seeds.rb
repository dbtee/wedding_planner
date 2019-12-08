# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all

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

