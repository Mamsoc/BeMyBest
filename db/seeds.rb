# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "destroy memories"
Memory.destroy_all
p "destroy invitations"
Invitation.destroy_all
p "destroy projects"
Project.destroy_all
p "destroy users"
User.destroy_all
p "destroy scenarios"
Scenario.destroy_all

puts 'Creating scenarios...'
scenario1 = Scenario.create(title: "Anniversaire", img: "anniversaire.jpeg")
scenario2 = Scenario.create(title: "EVJF", img: "evjf.jpeg")
scenario3 = Scenario.create(title: "mariages", img: "mariages.jpeg")
puts '3 scenarios created!'

puts 'Creating users...'
user1 = User.create(email: "anthoine@example.com", password: "anthoine@example.com")
user2 = User.create(email: "elodie@example.com", password: "elodie@example.com")
user3 = User.create(email: "manu@example.com", password: "manu@example.com")
user4 = User.create(email: "lidwine@example.com", password: "lidwine@example.com")
user5 = User.create(email: "hadrien@example.com", password: "hadrien@example.com")
users = User.all

puts '5 users created!'

puts 'Creating projects...'
project = Project.create(title: "Anniversaire de Lucie", description: "yeay c'est l'anniv de Lucie preparons-lui une surprise", user: user1)
puts '1 project created!'

puts 'Creating invitations...'
i = 0
users.each do |user|
  unless user == user1
    p i
    Invitation.create(email: user.email, code: '123456', user: user, project: project)

    i += 1
  end
end
puts "#{i} invitations created"

puts 'Creating memories...'
i = 0
n = 0
users.each do |user|
  3.times do
    Memory.create(legend: "légende #{(n + 1) * (i + 1)}", user: user, project: project)
    n += 1
  end
end
puts "#{n} memories created"
