# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create user
user_1 = User.create!(name: 'Tony', email: 'tony@test.com', password:'iamsecure', password_confirmation:'iamsecure', github_username:'dohoonk')
user_2 = User.create!(name: 'Chester', email: 'tony2@test.com', password:'iamsecure', password_confirmation:'iamsecure', github_username:'')

# Create post 
100.times do |index|
    Post.create!(
                title: Faker::Books::Lovecraft.tome,
                body: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                user_id: user_1.id    
            )
end

# Create comments 
50.times do |index|
    Comment.create!(
                user_id: user_1.id ,
                message: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                post_id: user_2.id    
            )
end

# Create rating
50.times do |index|
    Rating.create!(
        user_id: user_1.id ,
        rater_id: user_2.id ,
        rating: rand(6)
    )
end