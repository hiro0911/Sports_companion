FactoryBot.define do
  factory :sport do
  	sport_genre { "スポーツ名" }
  	image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no_image.png')) }
  end
end