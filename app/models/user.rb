class User < ApplicationRecord
  has_many :follow_requests_sent, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :follow_requests_received, class_name: "FollowRequest", foreign_key: "receiver_id"

  has_and_belongs_to_many :followers, class_name: "User", join_table: "followers", foreign_key: "user_id", association_foreign_key: "follower_id"
  has_and_belongs_to_many :following, class_name: "User", join_table: "followers", foreign_key: "follower_id", association_foreign_key: "user_id"

  has_many :posts, class_name: "Post", foreign_key: "author_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
