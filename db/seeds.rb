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
scenario1 = Scenario.create!(title: "Quizz", img: "anniversaire.jpg")
scenario4 = Scenario.create!(title: "Une requête pour un Winner", img: "mariages.jpg")
scenario2 = Scenario.create!(title: "Je n'ai jamais", img: "evjf.jpg")
scenario3 = Scenario.create!(title: "Escape Game", img: "mariages.jpg")
puts '4 scenarios created!'

puts 'Creating cards...'
card1 = Card.create(title: "parents", question: "En quelle année est née ta soeur", scenario: scenario1)
card2= Card.create(title: "animaux1", question: "Comment s'appelait ton premier animal ? ", scenario: scenario1)
card3= Card.create(title: "amis", question: "qui est ta meilleure amie", scenario: scenario1)
card4= Card.create(title: "passion", question: "quelle est ta passion", scenario: scenario1)
card5= Card.create(title: "passion", question: "Ton plus beau voyage", scenario: scenario1)
card6= Card.create(title: "passion", question: "En quelle année as-tu étais diplomée", scenario: scenario1)
puts '6 cards created!'

puts 'Creating users...'

user1 = User.create(email: "antoine@bmybest.me", password: "antoine@bmybest.me", first_name: "Antoine")
photo_user1 = File.open(Rails.root.join("app/assets/images/img_seed/users/antoine.jpg"))
user1.photo.attach(io: photo_user1, filename: "antoine.jpg", content_type: "image/jpg")
user1.save
user2 = User.create(email: "marion@bmybest.me", password: "marion@bmybest.me", first_name: "Marion")
photo_user2 = File.open(Rails.root.join("app/assets/images/img_seed/users/marion.jpg"))
user2.photo.attach(io: photo_user2, filename: "marion.jpg", content_type: "image/jpg")
user2.save
users = User.all
puts '2 users created!'

puts 'Creating projects...'
project = Project.create(title: "Anniversaire de Lucile", description: "yeay c'est l'anniv de Lucile preparons-lui une surprise", user: user1, scenario: scenario1, besty_first_name: "Lucile")
project2 = Project.create(title: "Anniversaire d'Elodie", description: "25 ans Elodie", user: user2, scenario: scenario1, besty_first_name: "Élodie")
img_project = File.open(Rails.root.join("app/assets/images/img_seed/Lucile.jpg"))
img_project2 = File.open(Rails.root.join("app/assets/images/img_seed/elodie1.JPG"))
project.photo.attach(io: img_project, filename: "Lucile.jpg", content_type: "image/jpg")
project.save
project2.photo.attach(io: img_project2, filename: "elodie1.jpg", content_type: "image/JPG")
project2.save
puts '2 projects created!'


puts 'Creating invitations...'
i = 0
users.each do |user|
  unless user == user1
    Invitation.create(email: user.email, code: '123456', user: user, project: project)
    i += 1
  end
end
puts "#{i} invitations created"

puts 'Creating memories for Antoine..'
n = 1
users.each do |user|
  5.times do
    memory = Memory.new(legend: "Un super moment avec Antoine ! #{n}", response: "...", user: user, project: project)
    file = File.open(Rails.root.join("app/assets/images/img_seed/memory#{n}_photo.jpg"))
    memory.photo.attach(io: file, filename: "memory#{n}_photo.jpg", content_type: "image/jpg")
    memory.save
    p n += 1
  end
end
puts "#{Memory.count} memories created"

puts 'Creating memories for Elodie..'
n = 1
users.each do |user|
  5.times do
    memory2 = Memory.new(legend: "un super moment avec Élodie ! #{n}", response: "...", user: user2, project: project2)
    file = File.open(Rails.root.join("app/assets/images/img_seed/elodie#{n}.JPG"))
    memory2.photo.attach(io: file, filename: "elodie#{n}.JPG", content_type: "image/JPG")
    memory2.save
    p n += 1
  end
end
puts "#{Memory.count} memories created"
