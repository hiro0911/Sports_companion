class CommentRoom < ApplicationRecord

	has_many :comments
	belongs_to :sport
end
