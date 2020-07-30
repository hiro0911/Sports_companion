FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { "hoge@hoge" }
    introduction { Faker::Lorem.characters(number:20) }
    age { 27 }
    sex { "女性" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end