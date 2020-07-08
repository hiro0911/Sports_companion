class Sport < ApplicationRecord

	has_many :teams
	has_many :comment_rooms
end
