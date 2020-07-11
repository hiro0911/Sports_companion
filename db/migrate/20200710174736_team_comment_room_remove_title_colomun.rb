class TeamCommentRoomRemoveTitleColomun < ActiveRecord::Migration[5.2]
  def change
  	remove_column :team_comment_rooms, :title, :string
  end
end
