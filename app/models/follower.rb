class Follower < ApplicationRecord
  validates :user_id, :follower_id, presence: true

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
end
