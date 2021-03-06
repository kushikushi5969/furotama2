require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @follower = FactoryBot.create(:user, name: "フォローする人", email: "follower@example.com")
    @followed = FactoryBot.create(:user, name: "フォローされる人", email: "followed@example.com")
    @relationship = Relationship.create(user_id: @follower.id, follow_id: @followed.id)
  end

  it "@relationshipが有効であること" do
    expect(@relationship).to be_valid
  end

  it "user_idが空白のrelationshipは無効であること" do
    @relationship.user_id = nil
    expect(@relationship).to be_invalid
  end

  it "follow_idが空白のrelationshipは無効であること" do
    @relationship.follow_id = nil
    expect(@relationship).to be_invalid
  end
end
