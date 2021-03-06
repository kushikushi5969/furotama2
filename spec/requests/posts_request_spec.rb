require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @area = FactoryBot.create(:area)
    @test_post = FactoryBot.create(:post, user: @user, area: @area)
    sign_in @user
  end

  describe "index" do
    before {get posts_path}
    example "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end
  end

  describe "show" do
    before { get post_path(@test_post.id) }

    example "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end
  end

  describe "new" do
    before {get new_post_path}
    example "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end
  end

  describe "create" do
    before {get new_post_path}
    example "投稿すること" do
      post posts_path, params: { post: FactoryBot.attributes_for(:post) }
      expect(response).to redirect_to new_post_path
    end
  end

  describe "destroy" do
    example "投稿一覧ページにリダイレクトされること" do
      expect do
        delete post_path(@test_post.id)
        expect(response).to redirect_to posts_path
      end
    end
  end
end
