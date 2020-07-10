# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sport.create!(
	sport_genre: "バスケットボール"
)
Sport.create!(
	sport_genre: "サッカー"
)
Sport.create!(
	sport_genre: "野球"
)
Sport.create!(
	sport_genre: "テニス"
)
Sport.create!(
	sport_genre: "バレーボール"
)
Sport.create!(
	sport_genre: "ランニング"
)
47.times do |n|
  Prefecture.create!(content: n + 1)
end