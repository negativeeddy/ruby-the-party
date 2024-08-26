class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users = User.all.map { |u| { id: u.id, email: u.email, is_following: u.followers.any? { |f| f.id == @user.id  } } }
  end
end
