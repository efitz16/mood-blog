# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@user1 = User.create(first_name: "Liz", last_name: "Fitz", username: Faker::TwinPeaks.character, email: "efitz16@me.com", password: "Password1")
@user2 = User.create(first_name: "Mary", last_name: "Strac", username: Faker::TwinPeaks.character, email: "mstracc@gmail.com", password: "Password2")
@user3 = User.create(first_name: "Harry", last_name: "Loyd", username: Faker::TwinPeaks.character, email: "hloyd@gmail.com", password: "Password3")

50.times do
  Post.create(title: Faker::TwinPeaks.quote, body: Faker::Hipster.paragraphs(rand(1..10)), user: User.all.sample)
end

100.times do
  Comment.create(body: Faker::Hipster.paragraphs(rand(1..4)), user: User.all.sample, post: Post.all.sample)
end

#test cases
testcase1 = Post.create(title: "Created by user 1", body: "This post created by first user", user: @user1)

testcase2 = Post.create(title: "Created by user 2", body: "This post created by second user", user: @user2)

30.times do
  Comment.create(body: Faker::Hipster.paragraphs(rand(1..4)), user: [@user1, @user2].sample, post: [testcase1, testcase2].sample)
end

Comment.create(body: "comment by user 1", user: @user1, post: testcase2)

Comment.create(body: "comment by user 2", user: @user2, post: testcase1)

Comment.create(body: "comment by user 3", user: @user3, post: testcase2)
