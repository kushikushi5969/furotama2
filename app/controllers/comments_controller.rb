class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
    render :create
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
