class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post.id), alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
