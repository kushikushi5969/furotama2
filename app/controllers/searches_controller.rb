class SearchesController < ApplicationController
  def index
    @categories = Category.all
    @q = Post.ransack(params[:q])
    @posts_search = @q.result(distinct: true).includes(:user, :images, :area, :categories, :favorites).order('created_at desc').page(params[:page]).per(10)
  end

  def random_search
    @posts = Post.includes(:user, :images, :area, :categories, :favorites).find(Post.pluck(:id).sample(4))
    gon.postsinfo = @posts
  end
end
