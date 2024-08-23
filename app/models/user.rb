class User < ApplicationRecord
  has_many :follow_requests_sent, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :follow_requests_received, class_name: "FollowRequest", foreign_key: "receiver_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
