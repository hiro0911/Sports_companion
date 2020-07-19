class Sport < ApplicationRecord
	mount_uploader :image_id, ImagesUploader
	has_many :teams
	has_many :comment_rooms
end
