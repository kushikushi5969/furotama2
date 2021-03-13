FactoryBot.define do
  factory :post do
    name   { "テスト温泉" }
    review { "露天風呂が最高！" }
    address { "北海道札幌市" }
    latitude { "43.0687" }
    longitude { "141.349" }
    association :user, factory: :user
    association :area, factory: :area
    after(:build) do |post|
      post.images << FactoryBot.build(:image, post: post)
    end
  end

  factory :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test-image.jpg')) }
  end
end
