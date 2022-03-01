# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Chatroom.destroy_all

Flashcard.destroy_all

Review.destroy_all
Rental.destroy_all
Slot.destroy_all

User.destroy_all
Agency.destroy_all

Category.destroy_all
Offer.destroy_all

#Seed of agency
agency1 = Agency.new({
  name: "Paris agency"
})
agency1.save!

#Seed of users
raph = User.new({
  first_name: "raph",
  last_name: "grelon",
  email: "raph@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
raph.agency = agency1
raph.save!

nico = User.new({
  first_name: "nico",
  last_name: "delph",
  email: "nico@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
nico.agency = agency1
nico.save!

#Seed of category
category1 = Category.new({
  name: "street"
})
category1.save

#Seed of offers

offer1 = Offer.new({
  address: "Villa Gaudelet",
  description: "Le Wagon est un musée vraiment bien...",
  video_type: "Live",
  city: "Paris",
  title: "Visite du Wagon",
  price: 3.6
})

offer1.user = raph
offer1.category = category1
offer1.save!

offer2 = Offer.new({
  address: "Rue Recamier",
  description: "Rpz le 75007...",
  video_type: "Live",
  city: "Paris",
  title: "Visite de Raph",
  price: 3.6
})

offer2.user = nico
offer2.category = category1
offer2.save!

offer3 = Offer.new({
  address: "Boulevard des plages",
  description: "La plus belle cote",
  video_type: "Live",
  city: "Biarritz",
  title: "Sables d'or",
  price: 3.6
})

offer3.user = raph
offer3.category = category1
offer3.save!

offer4 = Offer.new({
  address: "Centre-ville",
  description: "La campagne",
  video_type: "Live",
  city: "Arcangues",
  title: "Arcangueszoo",
  price: 3.6
})

offer4.user = nico
offer4.category = category1
offer4.save!

#Seed of slots

slot1 = Slot.new({
  start_at: "10/10/2020",
})
slot1.offer = offer1
slot1.user = raph


#Seed of rental
rental1 = Rental.new
rental1.user = nico
rental1.slot = slot1
rental1.save!

#Seed of reviews
review1 = Review.new({
  content: "Super visite",
  rating: 5
})
review1.rental = rental1
review1.save!

#Seed of flashcards
flashcard = Flashcard.new({
  question: "What is this building ?",
  answer: "It is le WAGON"
})

flashcard.offer = offer1
flashcard.save!



####################"LOOGING THE RESULTS FOR TESTING"#############
puts "#############BEGGINING OF TESTS FOLLOWING SEED IMPLEMENTATION############"
p ""
p ""

p "-----------TEST IF SEED HAS BEEN ADDED----------"

puts "------------------Agency------------------"
agencies = Agency.all
p agencies
puts "-------------------------------------------"
puts ""

puts "------------------USERS------------------"
users = User.all
p users
puts "-------------------------------------------"
puts ""


puts "------------------OFFERS------------------"
offers = Offer.all
p offers
puts "-------------------------------------------"
puts ""

puts "------------------CATEGORIES------------------"
categories = Category.all
p categories
puts "-------------------------------------------"
puts ""

puts "------------------SLOTS------------------"
slots = Slot.all
p slots
puts "-------------------------------------------"
puts ""

puts "------------------RENTALS------------------"
rentals = Rental.all
p rentals
puts "-------------------------------------------"
puts ""

puts "------------------REVIEWS------------------"
reviews = Review.all
p reviews
puts "-------------------------------------------"
puts ""


puts "------------------Flashcard------------------"
flashcards = Flashcard.all
p flashcards
puts "-------------------------------------------"
puts ""


p "-----------TEST OF THROUGH and other Active record----------"

p "------------------Reach slots and reviews from offers------------------"
lewagon = Offer.find_by(title: "Visite du Wagon")
p "slots from le wagon = #{lewagon.slots}"
p "rentals from le wagon = #{lewagon.rentals}"
p "reviews from le wagon = #{lewagon.reviews}"
puts ""
puts ""


p "-----------TEST OF Active records ----------"
# to be completed

puts "#########END OF TEST#########"
