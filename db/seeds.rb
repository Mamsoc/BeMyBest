# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating scenarios...'
scenario1 = Scenario.create([{ title: "Anniversaire", img: "anniversaire.jpeg"}])
scenario2 = Scenario.create([{ title: "EVJF", img: "evjf.jpeg" }])
scenario3 = Scenario.create([{ title: "mariages", img: "mariages.jpeg" }])
puts '3 scenarios created!'

puts 'Creating users...'
user = User.create([{ email: "elodie@example", password: "elodie@example" }])
puts '1 user created!'

projet = Project.create([{ title: "Anniversaire de Lucie",description: "yeay c'est l'anniv de Lucie preparons-lui une surprise", user:  user} ])


# db/seeds.rb


chez_gladines = Restaurant.new(name: "Chez Gladines")
chez_gladines.save!
puts 'Finished!'
