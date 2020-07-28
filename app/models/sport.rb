class Sport < ApplicationRecord
	# refileを使う設定
  attachment :image
  validates :sport_genre, presence: true
  has_many :teams
  has_many :comment_rooms
end
