require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @area = FactoryBot.create(:area)
    @post = FactoryBot.create(:post, user: @user, area: @area)
  end

  describe "create" do
    context "画像含む値が正常に渡された場合" do
      example "投稿が成功すること" do
        expect(@post).to be_valid
      end
    end
  end

  describe "バリデーション" do
    context "user_idが空の場合" do
      example "投稿に失敗すること" do
        @post.user_id = nil
        @post.valid?
        expect(@post).to be_invalid
      end
    end

    context "area_idが空の場合" do
      example "投稿に失敗すること" do
        @post.area_id = nil
        @post.valid?
        expect(@post).to be_invalid
      end
    end

    context "nameが21文字以上の場合" do
      example "投稿に失敗すること" do
        @post.name = "a" * 21
        @post.valid?
        expect(@post.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "nameが20文字以下の場合" do
      example "投稿に成功すること" do
        @post.name = "a" * 20
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context "reviewが151文字以上の場合" do
      example "投稿に失敗すること" do
        @post.review = "a" * 151
        @post.valid?
        expect(@post.errors[:review]).to include("は150文字以内で入力してください")
      end
    end

    context "reviewが150文字以下の場合" do
      example "投稿に成功すること" do
        @post.review = "a" * 150
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context "addressが空の場合" do
      example "投稿に失敗すること" do
        @post.address = nil
        @post.valid?
        expect(@post).to be_invalid
      end
    end
  end
end
