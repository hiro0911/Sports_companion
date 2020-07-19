class Team < ApplicationRecord

	has_many :team_members
	has_many :team_comment_rooms
	has_many :users, through: :team_members
	belongs_to :sport


	attachment :image
end
