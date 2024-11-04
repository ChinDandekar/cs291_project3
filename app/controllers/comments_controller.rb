class CommentsController < ApplicationController
  before_action :require_author

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(author_id: @current_author.id))
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
