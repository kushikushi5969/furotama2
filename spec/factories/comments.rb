FactoryBot.define do
  factory :comment do
    text { "いい景色ですね！" }
    association :user, factory: :user
    association :post, factory: :post
  end
end
