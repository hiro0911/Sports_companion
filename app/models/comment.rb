class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :comment_room, optional: true
end
