# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "destroy projects"
Project.destroy_all
p "destroy scenarios"
Scenario.destroy_all
p "destroy user"
User.destroy_all

p "create scenarios"
scenario1 = Scenario.create(title: "Anniversaire", img: "anniversaire.jpeg")
scenario2 = Scenario.create(title: "EVJF", img: "evjf.jpeg")
scenario3 = Scenario.create(title: "mariages", img: "mariages.jpeg")

user = User.create(email: "elodie@example", password: "elodie@example")

projet = Project.create(title: "Anniversaire de Lucie", description: "yeay c'est l'anniv de Lucie preparons-lui une surprise", user:  user)
