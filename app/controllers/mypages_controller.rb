class MypagesController < ApplicationController
  before_action :check_guest, only: [:destroy]

  def show
    @user = User.find_by(id: params[:id])
    @categories = Category.all
    @posts = @user.posts.all.includes(:images, :area, :categories, :favorites, :comments).order('created_at desc').page(params[:page]).per(10)
    @favo_posts = @user.favorite_posts.all.includes(:user, :images, :area, :categories, :favorites, :comments).order('created_at desc').page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'アカウントを削除しました'
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(6)
    @title = "#{@user.name}さんのフォロー"
    render 'mypages/show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.order('created_at desc').page(params[:page]).per(6)
    @title = "#{@user.name}さんのフォロワー"
    render 'mypages/show_follow'
  end

  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストの削除はできません'
    end
  end

end
