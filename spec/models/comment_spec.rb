require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    @comment = FactoryBot.create(:comment, user: @user, post: @post)
  end

  describe "create" do
    context "値が正常に渡された場合" do
      example "投稿が成功すること" do
        expect(@comment).to be_valid
      end
    end
  end

  describe "バリデーション" do
    context "user_idが空の場合" do
      example "投稿に失敗すること" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment).to be_invalid
      end
    end

    context "post_idが空の場合" do
      example "投稿に失敗すること" do
        @comment.post_id = nil
        @comment.valid?
        expect(@comment).to be_invalid
      end
    end

    context "textが151文字以上の場合" do
      example "投稿に失敗すること" do
        @comment.text = "a" * 151
        @comment.valid?
        expect(@comment.errors[:text]).to include("は150文字以内で入力してください")
      end
    end

    context "textが150文字以下の場合" do
      example "投稿に成功すること" do
        @comment.text = "a" * 150
        @comment.valid?
        expect(@comment).to be_valid
      end
    end
  end
end
