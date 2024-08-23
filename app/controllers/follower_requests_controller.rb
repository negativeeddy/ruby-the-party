class FollowerRequestsController < ApplicationController
  before_action :authenticate_user!

  new do
    raise "Not implemented"
  end

  def create
    puts "params: #{params}"
    puts "#{current_user.id} != #{params[:user_id]}"
    if current_user.id != params[:user_id].to_i
      raise "Not authorized"
    end

    FollowRequest.create(sender_id: current_user.id, receiver_id: params[:follow_id])
    redirect_to follower_requests_path
  end

  def destroy
    req = FollowRequest.find(params[:id])
    if req.sender_id == current_user.id || req.receiver_id == current_user.id
      req.destroy
      redirect_to follower_requests_path
    else
      raise "Not authorized"
    end
  end

  def update
    req = FollowRequest.find(params[:id])
    if req.receiver_id == current_user.id
      req.accept
      req.destroy
      redirect_to follower_requests_path
    else
      raise "Not authorized"
    end
  end

  def index
    @requests_sent = FollowRequest.where(sender_id: current_user.id)
    @requests_received = FollowRequest.where(receiver_id: current_user.id)
  end
end
