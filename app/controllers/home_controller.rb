class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.select { |u| u.parent_id == nil }
                     .sort_by { |x| x[:created_at] }.reverse
  end
end
