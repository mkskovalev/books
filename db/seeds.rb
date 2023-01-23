require 'faker'

10.times do
  Book.create!(
    name: Faker::Book.title,
    author: Faker::Book.author,
    date: rand(1800..2000)
  )
end
