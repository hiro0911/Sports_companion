class Like < ApplicationRecord
  validates :comment_id, :user_id, presence: true
  belongs_to :comment
  belongs_to :user
   # post_idとuser_idの組が1組だけ
  validates_uniqueness_of :comment_id, scope: :user_id
end
