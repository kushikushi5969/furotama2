class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
    render :create
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment.destroy
    # render :destroy
    # redirect_to post_path(@post.id), alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
