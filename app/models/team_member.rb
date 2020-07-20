class TeamMember < ApplicationRecord
	validates :user_id, presence: true, uniqueness: true
	validates :team_id, presence: true
	belongs_to :user
	belongs_to :team
end
