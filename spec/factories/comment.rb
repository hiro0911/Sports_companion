
FactoryBot.define do
  factory :comment do
    sentence {Faker::Lorem.characters(number:10) }
  end
end