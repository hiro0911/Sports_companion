class CommentRoom < ApplicationRecord
  validates :sport_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  has_many :comments
  belongs_to :sport
end
