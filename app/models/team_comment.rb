class TeamComment < ApplicationRecord
	validates :team_comment_room_id, presence: true
	validates :content, presence: true
	validates :user_id, presence: true
	belongs_to :user
	belongs_to :team_comment_room

end
