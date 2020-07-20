class TeamCommentRoom < ApplicationRecord
validates :team_id, presence: true
	has_many :team_comments
	belongs_to :team
end
