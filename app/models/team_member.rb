class TeamMember < ApplicationRecord
	
	belongs_to :user
	belongs_to :team
	
	validates :user_id, uniqueness: true
end
