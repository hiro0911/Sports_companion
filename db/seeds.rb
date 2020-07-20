# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sport.create!(
	sport_genre: "バスケットボール",
	image_id: open("./app/assets/images/sports-001.jpg")
)
Sport.create!(
	sport_genre: "サッカー",
	image_id: open("./app/assets/images/sports-002.jpg")
)
Sport.create!(
	sport_genre: "野球",
	image_id: open("./app/assets/images/sports-003.jpg")
)
Sport.create!(
	sport_genre: "テニス",
	image_id: open("./app/assets/images/sports-004.jpg")
)
Sport.create!(
	sport_genre: "バレーボール",
	image_id: open("./app/assets/images/sports-005.jpg")
)
Sport.create!(
	sport_genre: "ランニング",
	image_id: open("./app/assets/images/sports-006.jpg")
)

47.times do |n|
  Prefecture.create!(content: n + 1)
end
Team.create!(
	sport_id: 1,
	applicant: 4,
	area: "練馬区",
	team_name: "takayama",
	prefecture_id: 1,
	stance: "楽しくやろう",
	explanation: "明るく楽しいチームです。")
10.times do |n|
    User.create!(
      email: "demo#{n + 1}@demo",
      name: "demo太郎#{n + 1}",
      password: "111111",
      age: 20,
      sex: 1
    )
 end
10.times do |n|
	TeamMember.create!(
		user_id: n + 1,
		team_id: 1)
end
TeamCommentRoom.create!(
	team_id: 1)