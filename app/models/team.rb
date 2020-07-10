class Team < ApplicationRecord

	has_many :team_members
	has_many :team_comment_rooms
	belongs_to :sport

	attachment :image
end
