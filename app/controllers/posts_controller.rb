class PostsController < ApplicationController
  before_action :require_author
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = @current_author

    if @post.save
      redirect_to @post
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to(@post)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy()

    redirect_to(posts_path, status: :see_other)
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
