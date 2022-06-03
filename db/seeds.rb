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
p "destroy card"
Card.destroy_all
p "destroy scenarios"
Scenario.destroy_all

puts 'Creating scenarios...'
scenario1 = Scenario.create!(title: "Anniversaire", img: "anniversaire.jpg")
scenario2 = Scenario.create!(title: "EVJF", img: "evjf.jpg")
scenario3 = Scenario.create!(title: "mariages", img: "mariages.jpg")
puts '3 scenarios created!'

puts 'Creating cards...'
card1= Card.create(title: "parents", question: "En quelle année se sont rencontrés tes parents", scenario: scenario1)
card2= Card.create(title: "amis", question: "qui est ta meilleure amie", scenario: scenario1)
card3= Card.create(title: "passion", question: "quelle est ta passion", scenario: scenario1)
puts '3 cards created!'

puts 'Creating users...'
user1 = User.create(email: "anthoine@example.com", password: "anthoine@example.com")
user2 = User.create(email: "elodie@example.com", password: "elodie@example.com")
user3 = User.create(email: "manu@example.com", password: "manu@example.com")
user4 = User.create(email: "lidwine@example.com", password: "lidwine@example.com")
user5 = User.create(email: "hadrien@example.com", password: "hadrien@example.com")
users = User.all
puts '5 users created!'

puts 'Creating projects...'
project = Project.create(title: "Anniversaire de Lucile", description: "yeay c'est l'anniv de Lucile preparons-lui une surprise", user: user1, scenario: scenario1)
img_project = File.open(Rails.root.join("app/assets/images/img_seed/Lucile.jpg"))
project.photo.attach(io: img_project, filename: "Lucile.jpg", content_type: "image/jpg")
project.save
puts '1 project created!'

puts 'Creating invitations...'
i = 0
users.each do |user|
  unless user == user1
    Invitation.create(email: user.email, code: '123456', user: user, project: project)
    i += 1
  end
end
puts "#{i} invitations created"

puts 'Creating memories...'
n = 1
users.each do |user|
  3.times do
    memory = Memory.new(legend: "légende #{n}", response: "a", user: user, project: project, card: card1)
    file = File.open(Rails.root.join("app/assets/images/img_seed/memory#{n}_photo.jpg"))
    memory.photo.attach(io: file, filename: "memory#{n}_photo.jpg", content_type: "image/jpg")
    memory.save
    p n += 1
  end
end
puts "#{Memory.count} memories created"
