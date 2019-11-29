# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Create Authors'
5.times do
  Author.create_with(
    full_name: Faker::Name.name.downcase.strip.gsub(' ', ''),
    password: Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true)
  ).find_or_create_by(email: Faker::Internet.free_email)
end

puts 'Create Articles'
10.times do
  Article.create(
    title: Faker::Team.name,
    post: Faker::Hipster.paragraphs.map! {|w| "#{w}"}.join,
    created_at: Faker::Date.between(from: 3.months.ago, to: Date.today),
    author_id: Author.all.pluck(:id).sample
  )
end
