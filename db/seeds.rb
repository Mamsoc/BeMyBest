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
scenario1 = Scenario.create!(title: "Quizz", img: "Quizz.png")
scenario2 = Scenario.create!(title: "", img: "RPUW_logo.png")
scenario3 = Scenario.create!(title: "Je n'ai jamais", img: "Je_nai_jamais.jpg")
scenario4 = Scenario.create!(title: "Escape Game", img: "Unlock.png")
puts '4 scenarios created!'

puts 'Creating cards...'
card1 = Card.create(title: "animal", question: "Comment s'appelait ta première boule de poils", scenario: scenario1)
card2= Card.create(title: "grimace", question: "Qui est-ce", scenario: scenario1)
card3= Card.create(title: "souvenir", question: "Un souvenir inoubliable, c'était où", scenario: scenario1)
card4= Card.create(title: "prof", question: "Qui est ton prof préféré", scenario: scenario1)
# card1 = Card.create(title: "parents", question: "En quelle année est née ta soeur", scenario: scenario1)
# card2= Card.create(title: "animaux1", question: "Comment s'appelait ton premier animal ? ", scenario: scenario1)
# card3= Card.create(title: "amis", question: "qui est ta meilleure amie", scenario: scenario1)
# card4= Card.create(title: "passion", question: "quelle est ta passion", scenario: scenario1)
# card5= Card.create(title: "passion", question: "Ton plus beau voyage", scenario: scenario1)
# card6= Card.create(title: "passion", question: "En quelle année as-tu étais diplomée", scenario: scenario1)
puts '4 cards created!'

puts 'Creating users...'

user1 = User.create(email: "antoine@bmybest.me", password: "antoine@bmybest.me", first_name: "Antoine")
photo_user1 = File.open(Rails.root.join("app/assets/images/img_seed/users/antoine.jpg"))
user1.photo.attach(io: photo_user1, filename: "antoine.jpg", content_type: "image/jpg")
user1.save
user2 = User.create(email: "marion@bmybest.me", password: "marion@bmybest.me", first_name: "Marion")
photo_user2 = File.open(Rails.root.join("app/assets/images/img_seed/users/marion.jpg"))
user2.photo.attach(io: photo_user2, filename: "marion.jpg", content_type: "image/jpg")
user2.save
user3 = User.create(email: "test@bmybest.me", password: "test@bmybest.me", first_name: "MarionTest")
photo_user3 = File.open(Rails.root.join("app/assets/images/img_seed/users/marion.jpg"))
user3.photo.attach(io: photo_user3, filename: "marion.jpg", content_type: "image/jpg")
user3.save
users = User.all
puts '3 users created!'

puts 'Creating projects...'
project = Project.create(title: "Anniversaire de Lucile", description: "yeay c'est l'anniv de Lucile preparons-lui une surprise", user: user1, scenario: scenario1, besty_first_name: "Lucile")
img_project = File.open(Rails.root.join("app/assets/images/img_seed/Lucile.jpg"))
project.photo.attach(io: img_project, filename: "Lucile.jpg", content_type: "image/jpg")
project.save

project2 = Project.create(title: "Anniversaire d'Elodie", description: "25 ans Elodie", user: user2, scenario: scenario1, besty_first_name: "Élodie")
img_project2 = File.open(Rails.root.join("app/assets/images/img_seed/elodie1.JPG"))
project2.photo.attach(io: img_project2, filename: "elodie_projet.jpg", content_type: "image/JPG")
project2.save

project3 = Project.create(title: "Anniversaire d'Elodie", description: "25 ans Elodie", user: user3, scenario: scenario1, besty_first_name: "Élodie")
img_project3 = File.open(Rails.root.join("app/assets/images/img_seed/elodie1.JPG"))
project3.photo.attach(io: img_project3, filename: "elodie_projet.jpg", content_type: "image/JPG")
project3.save
puts '3 projects created!'


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
  3.times do
    p n
    memory = Memory.new(legend: "Un super moment avec Antoine ! #{n}", response: "...", user: user, project: project)
    file = File.open(Rails.root.join("app/assets/images/img_seed/memory#{n}_photo.jpg"))
    memory.photo.attach(io: file, filename: "memory#{n}_photo.jpg", content_type: "image/jpg")
    memory.save
    n += 1
  end
end
puts "#{Memory.count} memories created"


puts 'Creating memories for Elodie..'

p 1
memory1 = Memory.new(legend: "Roméo et Juliette", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie7.JPG"))
memory1.photo.attach(io: file, filename: "elodie7.JPG", content_type: "image/JPG")
memory1.save

p 2
memory2 = Memory.new(legend: "Un moyen incroyable !", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie3.JPG"))
memory2.photo.attach(io: file, filename: "elodie3.JPG", content_type: "image/JPG")
memory2.save

p 3
memory3 = Memory.new(legend: "La grande classe 😂", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/Morgane.JPG"))
memory3.photo.attach(io: file, filename: "Morgane.JPG", content_type: "image/JPG")
memory3.save

p 4
memory4 = Memory.new(legend: "Meilleures potes", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie2.JPG"))
memory4.photo.attach(io: file, filename: "elodie2.JPG", content_type: "image/JPG")
memory4.save

p 5
memory5 = Memory.new(legend: "Remise diplome ESME", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie4.JPG"))
memory5.photo.attach(io: file, filename: "elodie4.JPG", content_type: "image/JPG")
memory5.save

p 6
memory6 = Memory.new(legend: "Sisters 💕", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie6.JPG"))
memory6.photo.attach(io: file, filename: "elodie6.JPG", content_type: "image/JPG")
memory6.save

p 7
memory7 = Memory.new(legend: "La team", response: "...", user: user2, project: project2)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie8.JPG"))
memory7.photo.attach(io: file, filename: "elodie8.JPG", content_type: "image/JPG")
memory7.save

puts "#{Memory.count} memories created"


puts 'Creating memories for ElodieTest..'

p 8
memory8 = Memory.new(legend: "Roméo et Juliette", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie7.JPG"))
memory8.photo.attach(io: file, filename: "elodie7.JPG", content_type: "image/JPG")
memory8.save

p 9
memory9 = Memory.new(legend: "Un moyen incroyable !", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie3.JPG"))
memory9.photo.attach(io: file, filename: "elodie3.JPG", content_type: "image/JPG")
memory9.save

p 10
memory10 = Memory.new(legend: "La grande classe 😂", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/Morgane.JPG"))
memory10.photo.attach(io: file, filename: "Morgane.JPG", content_type: "image/JPG")
memory10.save

p 11
memory11 = Memory.new(legend: "Meilleures potes", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie2.JPG"))
memory11.photo.attach(io: file, filename: "elodie2.JPG", content_type: "image/JPG")
memory11.save

p 12
memory12 = Memory.new(legend: "Remise diplome ESME", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie4.JPG"))
memory12.photo.attach(io: file, filename: "elodie4.JPG", content_type: "image/JPG")
memory12.save

p 13
memory13 = Memory.new(legend: "Sisters 💕", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie6.JPG"))
memory13.photo.attach(io: file, filename: "elodie6.JPG", content_type: "image/JPG")
memory13.save

p 14
memory14 = Memory.new(legend: "La team", response: "...", user: user3, project: project3)
file = File.open(Rails.root.join("app/assets/images/img_seed/elodie8.JPG"))
memory14.photo.attach(io: file, filename: "elodie8.JPG", content_type: "image/JPG")
memory14.save

puts "#{Memory.count} memories created"
