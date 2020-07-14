class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :comment_room
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user # 投稿が誰にいいねされているのかを取得
end
