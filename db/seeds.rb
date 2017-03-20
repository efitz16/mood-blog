# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@user1 = User.new(first_name: "Liz", last_name: "Fitz", username: Faker::TwinPeaks.character, email: "efitz16@me.com", password: "Password1")
@user2 = User.new(first_name: "Mary", last_name: "Strac", username: Faker::TwinPeaks.character, email: "mstracc@gmail.com", password: "Password2")
@user3 = User.new(first_name: "Harry", last_name: "Loyd", username: Faker::TwinPeaks.character, email: "hloyd@gmail.com", password: "Password3")

50.times do
  Post.create(title: Faker::TwinPeaks.quote, body: Faker::Hipster.paragraphs(rand(0..10)), user: User.all.sample)
end

100.times do
  Comment.create(text: Faker::Hipster.paragraphs(rand(0..4)), user: User.all.sample, post: Post.all.sample)
end
