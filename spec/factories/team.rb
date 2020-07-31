FactoryBot.define do
  factory :team do
    area {Faker::Lorem.characters(number:10) }
    team_name { Faker::Lorem.characters(number:10) }
  end
end