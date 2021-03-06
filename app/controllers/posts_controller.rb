class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update]
  before_action :set_parents

  def index
    @posts = Post.includes(:user, :images, :area, :categories, :favorites, :comments).order('created_at desc').page(params[:page]).per(10)
    @categories = Category.all
    @q = Post.ransack(params[:q])
  end

  def new
    @post = Post.new
    @post.images.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿しました'
    else
      redirect_to new_post_path, alert: '各項目を入力してください'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @area = @post.area
    @area_child = Area.where('ancestry = ?', "#{@area.ancestry}")
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    if params[:post].keys.include?('image') || params[:post].keys.include?('images_attributes')
      if @post.valid?
        if params[:post].keys.include?('image')
          update_images_ids = params[:post][:image].values
          before_images_ids = @post.images.ids
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy unless update_images_ids.include?(before_img_id.to_s)
          end
        else
          before_images_ids = @post.images.ids
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy
          end
        end
        @post.update(post_params)
        redirect_to post_path(@post.id), notice: '編集しました'
      else
        redirect_to edit_post_path, alert: '各項目を入力してください'
      end
    else
      redirect_to edit_post_path, alert: '各項目を入力してください'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  def show
    @post = Post.find(params[:id])
    @favorite = Favorite.new
    @comment = Comment.new
    @comments = @post.comments.order('created_at')
    gon.post = @post
  end

  # def get_area_children
  #   @area_children = Area.find_by(id: params[:parent_id].to_s, ancestry: nil).children
  # end

  private

  def post_params
    params.require(:post).permit(
      :name,
      :review,
      :address,
      :latitude,
      :longitude,
      :area_id,
      category_ids: [],
      images_attributes: [:image, :id]
    )
    .merge(user_id: current_user.id)
  end

  def set_parents
    @area_parent = Area.where(ancestry: nil)
  end

  def ensure_user
    @post = Post.find_by(id: params[:id])
    if @post.user.id != current_user.id
      redirect_to posts_path, alert: '投稿者ではないため権限がありません'
    end
  end
end
