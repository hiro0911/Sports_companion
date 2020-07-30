FactoryBot.define do
  factory :sport do
  	sport_genre { Faker::Lorem.characters(number: 8) }
  end
end