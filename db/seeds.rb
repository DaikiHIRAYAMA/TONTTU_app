# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "サウナ太郎#{n + 1}",
      password: "password",
      condition: 3,
    )
    Sauna.create!(
      name: "サウナ",
      sauna_temperature: "90" ,
      sauna_humidity: "10",
      water_temperature: "18",
      user_id: "#{n + 1}",
  )
  end