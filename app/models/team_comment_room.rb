class TeamCommentRoom < ApplicationRecord

	has_many :team_comments
	belongs_to :team
end
