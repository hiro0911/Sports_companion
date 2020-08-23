FactoryBot.define do
  factory :comment_room do
    title {Faker::Lorem.characters(number:10) }
  end
end