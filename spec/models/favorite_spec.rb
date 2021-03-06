require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.create(:favorite)
  end

  it "@favoriteが有効であること" do
    expect(@favorite).to be_valid
  end

  it "user_idが空白のfavoriteは無効であること" do
    @favorite.user_id = nil
    expect(@favorite).to be_invalid
  end

  it "post_idが空白のfavoriteは無効であること" do
    @favorite.post_id = nil
    expect(@favorite).to be_invalid
  end
end
