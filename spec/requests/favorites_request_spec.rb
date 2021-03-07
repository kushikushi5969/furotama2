require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @area = FactoryBot.create(:area)
    @test_post = FactoryBot.create(:post, user: @user, area: @area)
    sign_in @user
  end
  let(:favo_params) { { user_id: @user.id, post_id: @test_post.id } }

  describe "create" do
    example "お気に入りすること" do
      expect do
        post post_favorites_path(@test_post.id), params: { favorite: favo_params, format: :js }
      end.to change(Favorite, :count).by(1)
    end
  end

  describe "destroy" do
    let!(:favorite) { create(:favorite, user_id: @user.id, post_id: @test_post.id) }
    example "お気に入り解除できること" do
      expect do
        delete post_favorite_path(post_id: @test_post.id, id: favorite.id), params: { favorite: favorite.id, format: :js }
      end.to change(Favorite, :count).by(-1)
    end
  end

end
