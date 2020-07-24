class Applicant < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :team_id
  validates :team_id, :user_id, presence: true
  belongs_to :user
  belongs_to :team
end
