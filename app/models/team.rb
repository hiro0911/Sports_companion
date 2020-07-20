class Team < ApplicationRecord
	validates :sport_id, :area, :team_name, :prefecture_id, presence: true
	validates :information, :explanation, length: {maximum: 400}
	validates :applicant, length: {maximum: 2}
	validates :stance, :team_name, :area, length: {maximum: 20}

	has_many :team_members
	has_many :team_comment_rooms
	has_many :users, through: :team_members
	belongs_to :sport


	attachment :image
end
