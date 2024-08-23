class FollowRequest < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  validates :sender_id, uniqueness: { scope: :receiver_id }
  validate :cannot_follow_self

  def cannot_follow_self
    if sender_id == receiver_id
      errors.add(:sender_id, "can't follow self")
    end
  end

  def accept
    Follower.create(user_id: receiver_id, follower_id: sender_id)
  end
end
