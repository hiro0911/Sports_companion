class Like < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  # いいねの重複防止
  validates_uniqueness_of :comment_id, scope: :user_id
  validates :comment_id, :user_id, presence: true
end
