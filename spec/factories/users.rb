FactoryBot.define do
  factory :user do
    sequence(:name)       { |n| "name" }
    sequence(:email)      { |n| "test#{n}@example.com" }
    password              { "password" }
    password_confirmation { "password" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test-image.jpg')) }
  end
end
