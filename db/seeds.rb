# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Post.destroy_all
Sub.destroy_all
User.destroy_all

5.times do
  User.create(
    username: Faker::Internet.username,
    password: "swordfish"
  )
end

10.times do 
  Sub.create!(
    title: Faker::Pokemon.name,
    description: Faker::Myst.quote,
    mod_id: User.ids.sample
  )
  
end

50.times do 
  test_id = Sub.ids.sample
  Post.create!(
    title: Faker::WorldOfWarcraft.hero,
    url: Faker::Internet.url,
    content: Faker::WorldOfWarcraft.quote,
    author_id: User.ids.sample,
    sub_ids: [test_id]
  )
end

