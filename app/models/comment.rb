class Comment < ApplicationRecord
	validates :user_id, :comment_room_id, presence: true
	validates :sentence, presence: true, length: {maximum: 200}
	belongs_to :user
	belongs_to :comment_room
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user # 投稿が誰にいいねされているのかを取得
end
