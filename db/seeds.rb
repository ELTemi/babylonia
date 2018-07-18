# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :mom_keys =>
    ["name", "email", "password"],
  :moms => [
    ["Max Charles", "max@abc.com", "password"],
    ["Skai Jackson", "skai@abc.com", "password"],
    ["Kaleo Elam", "kaleo@abc.com", "password"],
  ],

  :caregiver_keys =>
    ["name", "email", "password"],
  :caregivers => [
    ["Megan Charpentier", "megan@abc.com", "password"],
    ["Hayden Byerly", "hayden@abc.com", "password"],
    ["Tenzing Norgay Trainor", "tenzing@abc.com", "password"],
  ],

  :baby_keys =>
    ["name", "sex", "allergies"],
  :babies => [
    ["Davis Cleveland", "male", "nuts"],
    ["Nicole Sand", "female", "dairy"],
    ["Quvenzhané Wallis", "female", "none"]
  ],


  :dailylog_keys =>
   ["time_in", "nap", "meal", "diaper", "play_time", "time_out"],
  :dailylogs => [
    [Time.now, 2, 3, 2, 30, Time.now + 30],
    [Time.now, 3, 4, 1, 50, Time.now + 15],
  ],

}
