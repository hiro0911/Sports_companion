class AddCommentRoomTitle < ActiveRecord::Migration[5.2]
  def change
  	add_column :comment_rooms, :title, :string
  	add_column :team_comment_rooms, :title, :string
  end
end
