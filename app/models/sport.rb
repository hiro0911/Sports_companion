class Sport < ApplicationRecord
  validates :sport_genre, presence: true
  # carrierwaveを使う設定
  mount_uploader :image_id, ImagesUploader
  has_many :teams
  has_many :comment_rooms
end
