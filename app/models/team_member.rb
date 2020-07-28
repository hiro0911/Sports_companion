class TeamMember < ApplicationRecord
	# 同じチームには入れない（重複防止）
  validates_uniqueness_of :user_id, scope: :team_id
  validates :team_id, :user_id, presence: true
  belongs_to :user
  belongs_to :team
end
