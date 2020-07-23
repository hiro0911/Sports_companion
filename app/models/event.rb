class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20, minimum: 2 }
  validates :body, length: { maximum: 200 }
  belongs_to :user
end
