class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room, optional: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 200 }
end
