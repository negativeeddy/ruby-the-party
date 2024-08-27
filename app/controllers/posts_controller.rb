class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post_id = params[:id].to_i
    @post = Post.find(@post_id)
  end
end
