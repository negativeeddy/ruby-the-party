class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates :content, :author_id, presence: true

  has_many :replies, class_name: "Post", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Post", optional: true, foreign_key: "parent_id"
end
