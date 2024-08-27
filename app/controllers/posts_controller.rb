class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post_id = params[:id].to_i
    @post = Post.find(@post_id)
  end

  def new
    @post = Post.new
    if params[:reply_to] != nil
      @parentPost = Post.find(params[:reply_to])
      @post.parent_id = params[:reply_to]
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:content, :media, :parent_id)
  end
end
