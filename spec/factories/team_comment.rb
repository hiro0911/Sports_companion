FactoryBot.define do
  factory :team_comment do
    content {Faker::Lorem.characters(number:10) }
  end
end