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
card1 = Card.create(title: "parents", question: "En quelle année se sont rencontrés tes parents", scenario: scenario1)
card2 = Card.create(title: "animaux1", question: "Comment s'appelait ton premier animal ? ", scenario: scenario1)
card3 = Card.create(title: "amis", question: "qui est ta meilleure amie", scenario: scenario1)
card4 = Card.create(title: "passion", question: "quelle est ta passion", scenario: scenario1)
card5 = Card.create(title: "voyage", question: "Ton plus beau voyage", scenario: scenario1)
card6 = Card.create(title: "ecole", question: "En quelle année as-tu été diplomée", scenario: scenario1)
puts '3 cards created!'

puts 'Creating users...'
# u = 0
# userlist = ["antoine", "marie", "lidiwine", "hadrien", "elodie", "marion"]
# userlist.each do |person|
#   user = User.create(email: "#{person}@example.com", password: "#{person}@example.com", first_name: "#{person}")
#   userphoto = File.open(Rails.root.join("app/assets/images/img_seed/users/#{person.downcase}.jpg"))
#   user.photo.attach(io: userphoto, filename: "#{user.downcase}.jpg", content_type: "image/jpg")
#   user.save
#   p u += 1
# end
# puts "#{u} users created"

# Antoine
user1 = User.create(email: "antoine@example.com", password: "antoine@example.com", first_name: "Antoine")
user1photo = File.open(Rails.root.join("app/assets/images/img_seed/users/antoine.jpg"))
user1.photo.attach(io: user1photo, filename: "antoine.jpg", content_type: "image/jpg")
user1.save
p "Antoine created"

# Elodie
user2 = User.create(email: "elodie@example.com", password: "elodie@example.com", first_name: "Elodie")
user2photo = File.open(Rails.root.join("app/assets/images/img_seed/users/elodie.jpg"))
user2.photo.attach(io: user2photo, filename: "elodie.jpg", content_type: "image/jpg")
user2.save
p "Elodie created"

# Lidwine
user3 = User.create(email: "lidwine@example.com", password: "lidwine@example.com", first_name: "Lidwine")
user3photo = File.open(Rails.root.join("app/assets/images/img_seed/users/lidwine.jpg"))
user3.photo.attach(io: user3photo, filename: "lidwine.jpg", content_type: "image/jpg")
user3.save
p "Lidwine created"

# Hadrien
user4 = User.create(email: "hadrien@example.com", password: "hadrien@example.com", first_name: "Hadrien")
user4photo = File.open(Rails.root.join("app/assets/images/img_seed/users/hadrien.jpg"))
user4.photo.attach(io: user4photo, filename: "hadrien.jpg", content_type: "image/jpg")
user4.save
p "Hadrien created"

# Marion
user5 = User.create(email: "marion@example.com", password: "marion@example.com", first_name: "Marion")
user5photo = File.open(Rails.root.join("app/assets/images/img_seed/users/marion.jpg"))
user5.photo.attach(io: user5photo, filename: "marion.jpg", content_type: "image/jpg")
user5.save
p "Marion created"

# # Marie
# user6 = User.create(email: "marie@example.com", password: "marie@example.com", first_name: "Marie")
# user6photo = File.open(Rails.root.join("app/assets/images/img_seed/users/marie.jpg"))
# user6.photo.attach(io: user2photo, filename: "marie.jpg", content_type: "image/jpg")
# user6.save
# p "Marie created"

users = User.all
puts "#{users.count} users created!"

puts 'Creating projects...'
project = Project.create(title: "Anniversaire de Lucile", description: "yeay c'est l'anniv de Lucile preparons-lui une surprise", user: user1, besty_first_name: "Lucile")
project2 = Project.create(title: "Anniversaire d'Elodie", description: "25 ans Elodie", user: user2, besty_first_name: "Elodie")
img_project = File.open(Rails.root.join("app/assets/images/img_seed/Lucile.jpg"))
img_project2 = File.open(Rails.root.join("app/assets/images/img_seed/elodie1.JPG"))
project.photo.attach(io: img_project, filename: "Lucile.jpg", content_type: "image/jpg")
project.save
project2.photo.attach(io: img_project2, filename: "elodie1.jpg", content_type: "image/JPG")
project2.save
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

puts 'Creating memories. antoine..'
n = 1
users.each do |user|
  2.times do
    memory = Memory.new(legend: "légende #{n}", response: "a", user: user, project: project)
    file = File.open(Rails.root.join("app/assets/images/img_seed/memory#{n}_photo.jpg"))
    memory.photo.attach(io: file, filename: "memory#{n}_photo.jpg", content_type: "image/jpg")
    memory.save
    p n += 1
  end
end
puts "#{Memory.count} memories created"

puts 'Creating memories. Elodie..'
n = 1
users.each do |user|
  2.times do
    memory2 = Memory.new(legend: "légende #{n}", response: "a", user: user2, project: project2)
    file = File.open(Rails.root.join("app/assets/images/img_seed/elodie#{n}.JPG"))
    memory2.photo.attach(io: file, filename: "elodie#{n}.JPG", content_type: "image/JPG")
    memory2.save
    p n += 1
  end
end
puts "#{Memory.count} memories created"
