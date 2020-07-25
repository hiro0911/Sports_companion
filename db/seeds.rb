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
Team.create!(
	sport_id: 1,
	applicant: 4,
	area: "練馬区",
	team_name: "takayama",
	prefecture_id: 1,
	stance: "楽しくやろう",
	explanation: "明るい楽しいチームです。")

Team.create!(
	sport_id: 1,
	applicant: 8,
	area: "練馬区",
	team_name: "nakayama",
	prefecture_id: 1,
	stance: "本気頑張ってます。",
	explanation: "腕に自信がある人募集します！")

Team.create!(
	sport_id: 1,
	applicant: 6,
	area: "練馬区",
	team_name: "shittaka",
	prefecture_id: 1,
	stance: "のんびりやろう",
	explanation: "ゆるく楽しくやりましょう。")
10.times do |n|
    User.create!(
      email: "demo#{n + 1}@demo",
      name: "demo太郎#{n + 1}",
      password: "111111",
      age: 20,
      sex: 1
    )
 end
User.create!(
	email: "evergreen.0911@gmail.com",
	name: "hiro",
	password: "111111",
	age: 27,
	sex: 1)
User.create!(
	email: "evergreen.0911@gmail.com1",
	name: "runa",
	password: "111111",
	age: 27,
	sex: 2)
10.times do |n|
	TeamMember.create!(
		user_id: n + 1,
		team_id: 1)
end
TeamMember.create!(
	user_id: 11,
	team_id: 1)
TeamMember.create!(
	user_id: 11,
	team_id: 2)
TeamMember.create!(
	user_id: 12,
	team_id: 2)
TeamMember.create!(
	user_id: 11,
	team_id: 3)
Applicant.create!(
	user_id: 12,
	team_id: 1)
Applicant.create!(
	user_id: 12,
	team_id: 3)
TeamCommentRoom.create!(
	team_id: 1)
TeamCommentRoom.create!(
	team_id: 2)
TeamCommentRoom.create!(
	team_id: 3)