FactoryBot.define do
  factory :team do
  	id { 100 }
    sports_id {100}
    prefecture_id {1}
    area {Faker::Lorem.characters(number:10) }
    team_name { Faker::Lorem.characters(number:10) }
  end
end