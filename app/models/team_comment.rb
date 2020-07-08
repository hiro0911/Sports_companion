class TeamComment < ApplicationRecord

	belongs_to :user
	belongs_to :team_comment_room

end
